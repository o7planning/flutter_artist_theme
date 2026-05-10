import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../_endpoint.dart';
import '_base_tab_content_state.dart';

class SelectionTabContent extends StatefulWidget {
  const SelectionTabContent({super.key});

  @override
  State<SelectionTabContent> createState() => _SelectionTabContentState();
}

class _SelectionTabContentState
    extends FaColorsBaseTabContentState<SelectionTabContent> {
  int? _selectedIndex = 1;
  int? _currentIndex = 3;

  @override
  String getTabUsageUrl() {
    return "$faColorsBaseURL/selection/faColors.selection-en.html";
  }

  @override
  String getSelectedRowUsageUrl(String? token) {
    return "$faColorsBaseURL/selection/$token-en.html";
  }

  @override
  Widget buildGallery(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        final isSelected = _selectedIndex == index;
        final isCurrent = _currentIndex == index;

        final bgColor = isCurrent
            ? context.faColors.selection.rowCurrent
            : (isSelected
                  ? context.faColors.selection.rowSelected
                  : context.faColors.selection.rowNormal);

        final textColor = (isCurrent || isSelected)
            ? context.faColors.selection.inkSelected
            : context.faColors.selection.inkNormal;

        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Card(
            color: bgColor,
            elevation: isSelected ? 1 : 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: isSelected
                    ? context.faColors.selection.borderSelected
                    : context.faColors.divider.subtle,
                width: isSelected ? 2 : 0.5,
              ),
            ),
            child: ListTile(
              dense: true,
              onTap: () => setState(() => _selectedIndex = index),
              onLongPress: () => setState(() => _currentIndex = index),
              title: Text(
                "Sample Row #$index",
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Sub-info text",
                style: TextStyle(color: textColor.withValues(alpha: 0.7)),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: textColor,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  List<MapEntry<String, Color>> getColorCodeData() {
    final s = context.faColors.selection;
    return [
      MapEntry("faColors.selection.rowNormal", s.rowNormal),
      MapEntry("faColors.selection.rowSelected", s.rowSelected),
      MapEntry("faColors.selection.rowCurrent", s.rowCurrent),
      MapEntry("faColors.selection.rowHover", s.rowHover),
      MapEntry("faColors.selection.inkNormal", s.inkNormal),
      MapEntry("faColors.selection.inkSelected", s.inkSelected),
      MapEntry("faColors.selection.inkCurrent", s.inkCurrent),
    ];
  }

  @override
  String getCurrentCode() {
    return "TODO";
  }

  @override
  String getDescription() {
    return "Selection Namespace defines the visual state for interactive rows in tables or lists. "
        "It manages transitions between normal, hovered, and selected states to ensure consistent feedback.";
  }
}
