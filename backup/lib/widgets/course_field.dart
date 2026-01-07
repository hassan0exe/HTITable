import 'package:flutter/material.dart';

class CourseField extends StatefulWidget {
  const CourseField({super.key});

  @override
  State<CourseField> createState() => _CourseFieldState();
}

class _CourseFieldState extends State<CourseField> {
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _unitsController = TextEditingController();
  
  bool _hasSections = false;
  SubCourseField? subCourseField;
  
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
              controller: _courseNameController,
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
                    controller: _startTimeController,
                    decoration: const InputDecoration(
                      labelText: "وقت البدء",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _endTimeController,
                    decoration: const InputDecoration(
                      labelText: "وقت الانتهاء",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _unitsController,
                    decoration: const InputDecoration(
                      labelText: "عدد الوحدات",
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
                  value: _hasSections,
                  onChanged: (value) {
                    setState(() {
                      _hasSections = value!;
                      if (!_hasSections) {
                        subCourseField = null;
                      }else{
                        subCourseField = SubCourseField(
                          onDelete: () {});
                    }
                    });
                    }
                    ),       
                const Text("تحتوي على أقسام؟"),
              ],
            ),
            
            // Sub-courses section (only shown if checkbox is checked)
              const SizedBox(height: 16),
              
              // List of sub-courses
              subCourseField ?? Container(),
                          
            const SizedBox(height: 16),
            
            // Main add button
            ElevatedButton(
              onPressed: () {
                // Handle adding the main course with its sub-courses
                _addCourse();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("إضافة المادة", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
  
  void _addCourse() {
    
    // Clear the form
    _courseNameController.clear();
    _startTimeController.clear();
    _endTimeController.clear();
    _unitsController.clear();
    
    setState(() {
      _hasSections = false;
    });
    
    // Show a success message (optional)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تمت إضافة المادة بنجاح'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

// Sub-course field widget
class SubCourseField extends StatefulWidget {
  final VoidCallback onDelete;
  
  const SubCourseField({
    super.key,
    required this.onDelete,
  });
  
  @override
  State<SubCourseField> createState() => _SubCourseFieldState();
}

class _SubCourseFieldState extends State<SubCourseField> {
  final TextEditingController _subCourseNameController = TextEditingController();
  final TextEditingController _subStartTimeController = TextEditingController();
  final TextEditingController _subEndTimeController = TextEditingController();
  final TextEditingController _subUnitsController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.grey[50],
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with section number and delete button
            const SizedBox(height: 8),
            
            // Sub-course name field
            TextFormField(
              controller: _subCourseNameController,
              decoration: const InputDecoration(
                labelText: "اسم القسم",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.bookmark),
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Sub-course time and units
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _subStartTimeController,
                    decoration: const InputDecoration(
                      labelText: "وقت البدء",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _subEndTimeController,
                    decoration: const InputDecoration(
                      labelText: "وقت الانتهاء",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                                Expanded(
                  child: TextFormField(
                    controller: _subEndTimeController,
                    decoration: const InputDecoration(
                      labelText: "فترة اضافية",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _subCourseNameController.dispose();
    _subStartTimeController.dispose();
    _subEndTimeController.dispose();
    _subUnitsController.dispose();
    super.dispose();
  }
}