import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '_base_tab_content_state.dart';

class SpecialTabContent extends StatefulWidget {
  const SpecialTabContent({super.key});

  @override
  State<SpecialTabContent> createState() => _SpecialTabContentState();
}

class _SpecialTabContentState
    extends FaColorsBaseTabContentState<SpecialTabContent> {
  String _currentCode =
      "// Click on a component above to see the FaColors usage.";

  void _update(String code) => setState(() => _currentCode = code);

  @override
  List<MapEntry<String, Color>> getColorCodeData() {
    final special = context.faColors.special;
    return [
      MapEntry("faColors.special.highlight", special.highlight),
      MapEntry("faColors.special.sourceCode", special.sourceCode),
    ];
  }

  @override
  String getDescription() {
    return "Special Namespace is dedicated to technical visualizations, "
        "syntax highlighting, and system-level accents that stand out from the standard UI.";
  }

  @override
  String getCurrentCode() => _currentCode;

  @override
  Widget buildGallery(BuildContext context) {
    return Column(
      children: [
        buildGroup(context, "Code & Syntax", [
          ink(
            context,
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.faColors.surface.muted,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "final artist = FlutterArtist();",
                style: TextStyle(
                  fontFamily: 'Courier',
                  color: context.faColors.special.sourceCode,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            () => setState(
              () => _currentCode =
                  "// Syntax highlighting example\nText('code', style: TextStyle(color: context.faColors.special.sourceCode))",
            ),
          ),
        ]),
        const SizedBox(height: 24),
        buildGroup(context, "System Accents", [
          ink(
            context,
            Row(
              children: [
                Icon(Icons.terminal, color: context.faColors.special.highlight),
                const SizedBox(width: 8),
                Text(
                  "Technical Note",
                  style: TextStyle(
                    color: context.faColors.special.highlight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            () => setState(
              () => _currentCode =
                  "// Highlighted technical note\nIcon(Icons.terminal, color: context.faColors.special.highlight)",
            ),
          ),
        ]),
      ],
    );
  }
}
