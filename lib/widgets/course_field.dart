import 'package:flutter/material.dart';

class CourseField extends StatefulWidget {
  const CourseField({super.key});

  @override
  State<CourseField> createState() => _CourseFieldState();
}

class _CourseFieldState extends State<CourseField> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course name field - First row
            TextFormField(
              decoration: const InputDecoration(
                labelText: "اسم المادة",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.book),
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Second row: Start time, End time, Units
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "البدء",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "الانتهاء",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "الوحدات",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Checkbox for sections
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {}
                  ),       
                const Text("تحتوي على سكشن؟"),

                //combo box contains the 4 days 
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "اليوم",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    items: <String>['السبت', 'الأحد', 'الاثنين', 'الثلاثاء']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle the selected day
                    },
                  ),
                ),
                const SizedBox(width: 16),

              ],
            ),
            
            // Sub-courses section (only shown if checkbox is checked)
              const SizedBox(height: 16),
              
            const SizedBox(height: 16),
            
            // Main add button
            ElevatedButton(
              onPressed: () {
                // Handle adding the main course with its sub-courses
                _addCourse(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: const Size(double.infinity, 50),
                foregroundColor: Colors.white
              ),
              child: const Text("إضافة المادة", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  void _addCourse(BuildContext context) {
    // Show a success message (optional)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تمت إضافة المادة بنجاح'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
