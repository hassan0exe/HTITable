import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table/widgets/coustome_row.dart';

class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey, width: 1),
      defaultColumnWidth: const FlexColumnWidth(1.0),
      children: [
        // First row - Periods
        ...coustomeRow(
          heads: ["الفترات"],
          data: List.generate(8, (index) => "${index + 1}"),
          backgroundColor: Colors.blue[50],
          headBackgroundColor: Colors.blue[50],
          fontSize:7.sp,
        ),

        // Second row - Times
        ...coustomeRow(
          heads: ['الاوقات'],
          data: [
            '8:00 - 8:45',
            '8:45 - 9:30',
            '9:40 - 10:25',
            '10:25 - 11:10',
            '11:20 - 12:05',
            '12:05 - 12:50',
            '1:00 - 1:45',
            '1:45 - 2:30',
          ],
          fontSize:7.sp,
        ),

        // Weekdays rows
        ...coustomeRow(
          heads: ['السبت', 'الأحد', 'الاثنين', 'الثلاثاء'],
          headBackgroundColor: Colors.blue[100],
          fontSize:7.sp,
        ),
      ],
    );
  }
}
