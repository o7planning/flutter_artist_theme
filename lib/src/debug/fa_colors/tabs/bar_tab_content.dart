import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../_endpoint.dart';
import '_base_tab_content_state.dart';

class BarTabContent extends StatefulWidget {
  const BarTabContent({super.key});

  @override
  State<BarTabContent> createState() => _BarTabContentState();
}

class _BarTabContentState extends FaColorsBaseTabContentState<BarTabContent> {
  String _currentCode = "// Select a bar component to see its implementation.";

  void _update(String code) => setState(() => _currentCode = code);

  @override
  String getTabUsageUrl() {
    return "$faColorsBaseURL/bar/faColors.bar-en.html";
  }

  @override
  String getSelectedRowUsageUrl(String? token) {
    return "$faColorsBaseURL/bar/$token-en.html";
  }

  @override
  List<MapEntry<String, Color>> getColorCodeData() {
    final b = context.faColors.bar;
    return [
      MapEntry("faColors.bar.primary", b.primary),
      MapEntry("faColors.bar.secondary", b.secondary),
    ];
  }

  @override
  String getCurrentCode() {
    return _currentCode;
  }

  @override
  String getDescription() {
    return "Bar Namespace manages the structural layers of the UI. "
        "Bars provide consistent backgrounds for navigation elements.";
  }

  @override
  Widget buildGallery(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        buildGroup(context, "Navigation & Action Bars", [
          _barPreview(context, "Primary Bar", context.faColors.bar.primary),
          _barPreview(context, "Secondary Bar", context.faColors.bar.secondary),
        ]),
      ],
    );
  }

  Widget _barPreview(BuildContext context, String label, Color color) {
    final type = label.toLowerCase().split(' ')[0];
    final code =
        "// Use for AppBars, BottomBars or Footers\nContainer(\n  height: 40,\n  color: context.faColors.bar.$type,\n  child: const Center(child: Text('$label')),\n)";
    return InkWell(
      onTap: () => _update(code),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: context.faColors.divider.strong,
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: context.faColors.ink.primary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
