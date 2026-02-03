import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:table/bloc/tableCubit/course_cubit.dart';
import 'package:table/data/departments/electrical.dart';
import 'package:table/entity/course_duration_model.dart';

class PdfPrintButton extends StatelessWidget {
  final CoursesCubit cubit;

  const PdfPrintButton({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showPrintOptions(context, cubit.state.courses),
      icon: const Icon(Icons.print, color: Colors.blueAccent),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
    );
  }

  void _showPrintOptions(BuildContext context, List<CourseDurationModel> courses) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Options'),
        content: const Text('Choose how to export your schedule'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showPdfPreview(context, courses);
            },
            child: const Text('Preview PDF'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _downloadPdf(context, courses);
            },
            child: const Text('Download PDF'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future<void> _downloadPdf(BuildContext context, List<CourseDurationModel> courses) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final pdfBytes = await _generatePdfBytes(courses);
      Navigator.of(context).pop(); // close loading
      _downloadFile(pdfBytes, 'course_schedule.pdf');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('PDF downloaded successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      Navigator.of(context).pop();
      _showError(context, 'Failed to generate PDF: $e');
    }
  }

  Future<void> _showPdfPreview(BuildContext context, List<CourseDurationModel> courses) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final pdfBytes = await _generatePdfBytes(courses);
      Navigator.of(context).pop(); // close loading
      _openPdfInNewTab(pdfBytes);
    } catch (e) {
      Navigator.of(context).pop();
      _showError(context, 'Failed to generate PDF: $e');
    }
  }

  Future<Uint8List> _generatePdfBytes(List<CourseDurationModel> courses) async {
    final pdf = pw.Document();

    final List<String> timeSlots = [
      '8:00 - 8:45',
      '8:45 - 9:30',
      '9:40 - 10:25',
      '10:25 - 11:10',
      '11:20 - 12:05',
      '12:05 - 12:50',
      '1:00 - 1:45',
      '1:45 - 2:30',
      '2:40 - 3:25',
      '3:25 - 4:10',
    ];

    final List<String> days = ['saturday', 'sunday', 'monday', 'tuesday'];
    final List<String> arabicDays = ['السبت', 'الأحد', 'الاثنين', 'الثلاثاء'];

    // Build table data: 6 rows × 11 columns
    List<List<pw.Widget>> tableData = List.generate(6, (_) => List.generate(11, (_) => pw.Container()));

    // Row 0: Periods header
    tableData[0][0] = pw.Container(
      alignment: pw.Alignment.center,
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        'Periods',
        style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
      ),
    );
    for (int i = 1; i <= 10; i++) {
      tableData[0][i] = pw.Container(
        alignment: pw.Alignment.center,
        padding: const pw.EdgeInsets.all(6),
        child: pw.Text('$i', style: const pw.TextStyle(fontSize: 11)),
      );
    }

    // Row 1: Time slots
    tableData[1][0] = pw.Container(
      alignment: pw.Alignment.center,
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        'Times',
        style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
      ),
    );
    for (int i = 0; i < 10; i++) {
      tableData[1][i + 1] = pw.Container(
        alignment: pw.Alignment.center,
        padding: const pw.EdgeInsets.all(6),
        child: pw.Text(timeSlots[i], style: const pw.TextStyle(fontSize: 9)),
      );
    }

    // Collect all entries (main lectures + their sections)
    final List<({CourseDurationModel entry, bool isSection})> allEntries = [];

    void collectEntries(CourseDurationModel cd, {bool isSection = false}) {
      allEntries.add((entry: cd, isSection: isSection));
      if (cd.section != null) {
        collectEntries(cd.section!, isSection: true);
      }
    }

    for (final course in courses) {
      collectEntries(course);
    }

    // Fill days rows (2–5)
    for (int d = 0; d < 4; d++) {
      final englishDay = days[d];
      final arabicDay = arabicDays[d]; // only used for matching
      final rowIndex = d + 2;

      tableData[rowIndex][0] = pw.Container(
        alignment: pw.Alignment.center,
        padding: const pw.EdgeInsets.all(8),
        child: pw.Text(
          englishDay,
          style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
        ),
      );

      // Get all entries (lec + sec) for this day
      final dayEntries = allEntries.where((e) => e.entry.day == arabicDay).toList();

      for (final entry in dayEntries) {
        final cd = entry.entry;
        final start = cd.start;
        final end = cd.end;

        if (start < 1 || start > 10 || end < start || end > 10) continue;

        final elec = Electrical(isArabic: false);
        final tableCourse = elec.getCourse(cd.course.id, false);


        final cellText = '${tableCourse.name}\n${tableCourse.id}';

        for (int col = start; col <= end; col++) {
          // Overwrite if overlap (last wins) — can be improved later with stacking
          tableData[rowIndex][col] = pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(4),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(),
              color: entry.isSection ? PdfColors.blue50 : PdfColors.grey200,
            ),
            child: pw.Text(
              '${entry.isSection ? 'section' : ''}\n $cellText',
              style: pw.TextStyle(
                fontSize: 9,
                color: entry.isSection ? PdfColors.blue900 : PdfColors.black,
              ),
              textAlign: pw.TextAlign.center,
            ),
          );
        }
      }
    }

    final table = pw.Table(
      border: pw.TableBorder.all(),
      defaultColumnWidth: const pw.FixedColumnWidth(55),
      columnWidths: {0: const pw.FixedColumnWidth(75)},
      children: tableData.map((row) => pw.TableRow(children: row)).toList(),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(20),
            child: pw.Column(
              children: [
                pw.Text(
                  'HTI Student Table',
                  style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 20),
                table,
                pw.Spacer(),
                pw.Text(
                  'Created at: ${DateTime.now().toLocal().toString().substring(0, 19)}',
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }

  void _downloadFile(Uint8List bytes, String fileName) {
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..download = fileName
      ..style.display = 'none';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }

  void _openPdfInNewTab(Uint8List bytes) {
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.window.open(url, '_blank');

    Future.delayed(const Duration(seconds: 10), () {
      html.Url.revokeObjectUrl(url);
    });
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}