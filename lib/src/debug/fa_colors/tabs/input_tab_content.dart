import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../codes/fa_codes.dart';
import '_base_tab_content_state.dart';

class InputTabContent extends StatefulWidget {
  const InputTabContent({super.key});

  @override
  State<InputTabContent> createState() => _InputTabContentState();
}

class _InputTabContentState
    extends FaColorsBaseTabContentState<InputTabContent> {
  String _currentCode =
      "// Click on a component above to see the FaColors usage.";

  void _update(String code) => setState(() => _currentCode = code);

  @override
  List<MapEntry<String, Color>> getColorCodeData() {
    final input = context.faColors.input;
    return [
      MapEntry("faColors.input.background", input.background),
      MapEntry("faColors.input.border", input.border),
      MapEntry("faColors.input.focused", input.focused),
    ];
  }

  @override
  String getDescription() {
    return "Input Namespace defines the visual language for form elements. "
        "It maintains a neutral background (surfaceContainerLow) to ensure text readability "
        "and uses Primary only for the focused state border.";
  }

  @override
  Widget buildGallery(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        buildGroup(context, "Text Fields", [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: context.faColors.input.background,
              hintText: "Normal State",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.faColors.input.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.faColors.input.focused,
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ink(
            context,
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.faColors.input.background,
                border: Border.all(color: context.faColors.input.focused),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "Active Input Simulation",
                style: TextStyle(color: context.faColors.ink.primary),
              ),
            ),
            () => _update(FaCodes.inputUsage),
          ),
        ]),
      ],
    );
  }

  @override
  String getCurrentCode() {
    return _currentCode;
  }
}
