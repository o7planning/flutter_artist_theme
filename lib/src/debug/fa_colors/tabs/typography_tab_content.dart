import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../_endpoint.dart';
import '_base_tab_content_state.dart';

class TypographyTabContent extends StatefulWidget {
  const TypographyTabContent({super.key});

  @override
  State<TypographyTabContent> createState() => _TypographyTabContentState();
}

class _TypographyTabContentState
    extends FaColorsBaseTabContentState<TypographyTabContent> {
  String _currentCode =
      "// Click on a text sample to see the TextStyle implementation.";

  void _update(String code) => setState(() => _currentCode = code);

  @override
  String getTabUsageUrl() {
    return "$faColorsBaseURL/typography/faColors.ink-en.html";
  }

  @override
  String getSelectedRowUsageUrl(String? token) {
    return "$faColorsBaseURL/typography/$token-en.html";
  }

  @override
  List<MapEntry<String, Color>> getColorCodeData() {
    final t = context.faColors.ink;
    return [
      MapEntry("faColors.ink.primary", t.primary),
      MapEntry("faColors.ink.secondary", t.secondary),
      MapEntry("faColors.ink.label", t.label),
      MapEntry("faColors.ink.muted", t.muted),
      MapEntry("faColors.ink.success", t.success),
      MapEntry("faColors.ink.warning", t.warning),
      MapEntry("faColors.ink.danger", t.danger),
    ];
  }

  @override
  String getCurrentCode() {
    return _currentCode;
  }

  @override
  String getDescription() {
    return "Typography tokens are designed for large surface areas. "
        "If you are building a button, **STOP!** Use context.faColors.action.ink instead. "
        "Typography tokens ensure readability on surface.base and surface.container";
  }

  @override
  Widget buildGallery(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        buildGroup(context, "Content Hierarchy", [
          _textSample(
            context,
            "Primary Text",
            context.faColors.ink.primary,
            "Main content and titles.",
            isBold: true,
            fontSize: 16,
          ),
          _textSample(
            context,
            "Secondary Text",
            context.faColors.ink.secondary,
            "Supporting information and descriptions.",
            fontSize: 14,
          ),
          _textSample(
            context,
            "Label Text",
            context.faColors.ink.label,
            "Field labels, headers, and small metadata.",
            fontSize: 12,
            isUppercase: true,
          ),
          _textSample(
            context,
            "Muted Text",
            context.faColors.ink.muted,
            "Disabled states or very low priority hints.",
            fontSize: 11,
            isItalic: true,
          ),
        ]),
        const SizedBox(height: 24),
        buildGroup(context, "Semantic Status Text", [
          _textSample(
            context,
            "Success Message",
            context.faColors.ink.success,
            "Operation completed.",
            fontSize: 13,
          ),
          _textSample(
            context,
            "Warning Message",
            context.faColors.ink.warning,
            "Attention required.",
            fontSize: 13,
          ),
          _textSample(
            context,
            "Danger/Error Message",
            context.faColors.ink.danger,
            "Something went wrong.",
            fontSize: 13,
          ),
        ]),
      ],
    );
  }

  Widget _textSample(
    BuildContext context,
    String title,
    Color color,
    String desc, {
    double fontSize = 14,
    bool isBold = false,
    bool isItalic = false,
    bool isUppercase = false,
  }) {
    final tokenName = title.toLowerCase().split(' ')[0];
    final code =
        "Text(\n  'Your Text Here',\n  style: TextStyle(\n    color: context.faColors.ink.$tokenName,\n    fontSize: $fontSize,\n    fontWeight: ${isBold ? 'FontWeight.bold' : 'FontWeight.normal'},\n    fontStyle: ${isItalic ? 'FontStyle.italic' : 'FontStyle.normal'},\n  ),\n)";

    return InkWell(
      onTap: () => _update(code),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isUppercase ? title.toUpperCase() : title,
              style: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              ),
            ),
            Text(
              desc,
              style: TextStyle(color: context.faColors.ink.muted, fontSize: 11),
            ),
            const SizedBox(height: 4),
            Divider(color: context.faColors.divider.subtle, thickness: 0.5),
          ],
        ),
      ),
    );
  }
}
