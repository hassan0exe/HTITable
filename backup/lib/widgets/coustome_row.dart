import 'package:flutter/material.dart';

List<TableRow> coustomeRow({
  required List<String> heads,
  Color? headBackgroundColor,
  Color? backgroundColor,
  List<String>? data,
  double cellHeight = 60,  // Accept regular double values
  double padding = 8,      // Accept regular double values
  double fontSize = 14,    // Accept regular double values
}) {
  return heads.map((head) {
    return TableRow(
      children: [
        // First cell (head cell)
        TableCell(
          child: Container(
            color: headBackgroundColor,
            height: cellHeight,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Text(
                  head,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Data cells
        ...List.generate(8, (index) {
          return TableCell(
            child: Container(
              height: cellHeight,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                color: backgroundColor
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(padding / 2),
                  child: Text(
                    data != null && index < data.length ? data[index] : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }).toList();
}