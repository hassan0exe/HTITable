import 'package:flutter/material.dart';
import 'package:table/data/entity/course_model.dart';
import 'package:table/core/localization/localization.dart';

class SearchableTextField extends StatefulWidget {
  final String labelText;
  final List<CourseModel> searchList;
  final ValueChanged<CourseModel>? onSelected;
  final TextEditingController? controller;
  final bool showEnglish; // To control whether to show English names

  const SearchableTextField({
    super.key,
    required this.labelText,
    required this.searchList,
    this.onSelected,
    this.controller,
    this.showEnglish = false, // Default to Arabic
  });

  @override
  State<SearchableTextField> createState() => _SearchableTextFieldState();
}

class _SearchableTextFieldState extends State<SearchableTextField> {
  final SearchController _searchController = SearchController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // If an external controller is provided, sync with search controller
    if (widget.controller != null) {
      _searchController.text = widget.controller!.text;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  // Helper function to check if text contains Arabic characters
  bool _containsArabic(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]');
    return arabicRegex.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: _searchController,
      viewBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      viewElevation: 4,
      viewSurfaceTintColor: Colors.transparent,
      builder: (BuildContext context, SearchController controller) {
        return TextFormField(
          controller: controller,
          focusNode: _focusNode,
          textDirection: _containsArabic(controller.text) 
              ? TextDirection.rtl 
              : TextDirection.ltr,
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: () {
                controller.openView();
              },
            ),
          ),
          onTap: () {
            controller.openView();
          },
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        final query = controller.text.trim().toLowerCase();
        
        if (query.isEmpty) {
          return widget.searchList.map((item) {
            return _buildCourseTile(item);
          }).toList();
        }

        final filteredList = widget.searchList.where((item) {
          // Get both Arabic and English names
          final arabicName = Localization.getCourseName(true, item.id).toLowerCase();
          final englishName = Localization.getCourseName(false, item.id).toLowerCase();
          final courseId = item.id.toLowerCase();
          
          // Search in Arabic name, English name, and course ID
          return arabicName.contains(query) || 
                 englishName.contains(query) || 
                 courseId.contains(query);
        }).toList();

        return filteredList.map((item) {
          return _buildCourseTile(item);
        }).toList();
      },
    );
  }

  Widget _buildCourseTile(CourseModel item) {
    // Get both Arabic and English names
    final arabicName = Localization.getCourseName(true, item.id);
    final englishName = Localization.getCourseName(false, item.id);
    
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Show both names based on the showEnglish flag
          Text(
            widget.showEnglish ? englishName : arabicName,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textDirection: widget.showEnglish 
                ? TextDirection.ltr 
                : TextDirection.rtl,
          ),
          // Always show the other language in smaller text
          const SizedBox(height: 2),
          Text(
            widget.showEnglish ? arabicName : englishName,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
            textDirection: widget.showEnglish 
                ? TextDirection.rtl 
                : TextDirection.ltr,
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Text(
                item.id,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              if (item.units > 0)
                Text(
                  "${item.units} units",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.blue[600],
                  ),
                ),
            ],
          ),
        ],
      ),
      onTap: () {
        _searchController.closeView(widget.showEnglish 
            ? Localization.getCourseName(false, item.id) 
            : Localization.getCourseName(true, item.id));
        _focusNode.unfocus();
        widget.onSelected?.call(item);
        // Update external controller if provided
        if (widget.controller != null) {
          widget.controller!.text = widget.showEnglish 
              ? Localization.getCourseName(false, item.id) 
              : Localization.getCourseName(true, item.id);
        }
      },
    );
  }
}