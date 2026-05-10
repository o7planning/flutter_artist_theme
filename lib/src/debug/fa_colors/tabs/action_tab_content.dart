import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../_endpoint.dart';
import '../codes/fa_codes.dart';
import '_base_tab_content_state.dart';

class ActionTabContent extends StatefulWidget {
  const ActionTabContent({super.key});

  @override
  State<ActionTabContent> createState() => _ActionTabContentState();
}

class _ActionTabContentState
    extends FaColorsBaseTabContentState<ActionTabContent> {
  String _currentCode =
      "// Click on a component above to see the FaColors usage.";

  void _update(String code) => setState(() => _currentCode = code);

  @override
  String getTabUsageUrl() {
    return "$faColorsBaseURL/action/faColors.action-en.html";
  }

  @override
  String getSelectedRowUsageUrl(String? token) {
    return "$faColorsBaseURL/action/$token-en.html";
  }

  @override
  Widget buildGallery(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        buildGroup(context, "Standard Material Actions", [
          _btn(context, "Primary", () => _update(FaCodes.primaryBtn)),
          _btn(
            context,
            "Secondary",
            () => _update(FaCodes.secondaryBtn),
            isOutlined: true,
          ),
          _btn(
            context,
            "Ghost",
            () => _update(FaCodes.ghostBtn),
            isGhost: true,
          ),
        ]),
        const SizedBox(height: 24),
        buildGroup(context, "Soft Selected Components", [
          ink(
            context,
            _buildSampleChip(context),
            () => _update(FaCodes.sampleChip),
          ),
          ink(
            context,
            _buildSoftBadge(context),
            () => _update(FaCodes.softBadge),
          ),
        ]),
        const SizedBox(height: 24),
        buildGroup(context, "Semantic & Highlight", [
          ink(
            context,
            _buildTechHighlight(context),
            () => _update(FaCodes.techHighlight),
          ),
          _btn(
            context,
            "Danger Action",
            () => _update(FaCodes.dangerBtn),
            isDanger: true,
          ),
        ]),
      ],
    );
  }

  @override
  List<MapEntry<String, Color>> getColorCodeData() {
    final a = context.faColors.action;
    return [
      MapEntry("faColors.action.fill.primary", a.fill.primary),
      MapEntry("faColors.action.ink.primary", a.ink.primary),
      MapEntry("faColors.action.ink.onPrimaryFill", a.ink.onPrimaryFill),
      //
      MapEntry("faColors.action.fill.secondary", a.fill.secondary),
      MapEntry("faColors.action.ink.secondary", a.ink.secondary),
      MapEntry("faColors.action.ink.onSecondaryFill", a.ink.onSecondaryFill),
      //
      MapEntry("faColors.action.fill.ghost", a.fill.ghost),
      MapEntry("faColors.action.ink.ghost", a.ink.ghost),
      MapEntry("faColors.action.ink.onGhostFill", a.ink.onGhostFill),
      //
      MapEntry("faColors.action.fill.selected", a.fill.selected),
      MapEntry("faColors.action.ink.selected", a.ink.selected),
      MapEntry("faColors.action.ink.onSelectedFill", a.ink.onSelectedFill),
      //
      MapEntry("faColors.action.fill.highlight", a.fill.highlight),
      MapEntry("faColors.action.ink.highlight", a.ink.highlight),
      MapEntry("faColors.action.ink.onHighlightFill", a.ink.onHighlightFill),
      //
      MapEntry("faColors.action.fill.muted", a.fill.muted),
      MapEntry("faColors.action.ink.muted", a.ink.muted),
      MapEntry("faColors.action.ink.onMutedFill", a.ink.onMutedFill),
      //
      MapEntry("faColors.action.fill.success", a.fill.success),
      MapEntry("faColors.action.ink.success", a.ink.success),
      MapEntry("faColors.action.ink.onSuccessFill", a.ink.onSuccessFill),
      //
      MapEntry("faColors.action.fill.warning", a.fill.warning),
      MapEntry("faColors.action.ink.warning", a.ink.warning),
      MapEntry("faColors.action.ink.onWarningFill", a.ink.onWarningFill),
      //
      MapEntry("faColors.action.fill.danger", a.fill.danger),
      MapEntry("faColors.action.ink.danger", a.ink.danger),
      MapEntry("faColors.action.ink.onDangerFill", a.ink.onDangerFill),
      //
      MapEntry("faColors.action.fill.info", a.fill.info),
      MapEntry("faColors.action.ink.info", a.ink.info),
      MapEntry("faColors.action.ink.onInfoFill", a.ink.onInfoFill),
      //
      MapEntry("faColors.action.stroke.primary", a.stroke.primary),
      MapEntry("faColors.action.stroke.secondary", a.stroke.secondary),
      MapEntry("faColors.action.stroke.subtle", a.stroke.subtle),
      //
      MapEntry("faColors.action.state.hover", a.hover),
      MapEntry("faColors.action.state.pressed", a.pressed),
      MapEntry("faColors.action.state.selected", a.selected),
    ];
  }

  @override
  String getCurrentCode() {
    return _currentCode;
  }

  @override
  String getDescription() {
    return "Action Namespace provides standardized colors for buttons, chips, and semantic status icons. "
        "Use these tokens to maintain uniform call-to-action styles across the application.";
  }

  Widget _buildSampleChip(BuildContext context) {
    return Tooltip(
      decoration: BoxDecoration(
        color: context.faColors.surface.emphasized,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: context.faColors.divider.strong),
      ),
      constraints: const BoxConstraints(maxWidth: 220),
      richMessage: TextSpan(
        text: 'Selected Contributor Chip\n',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: context.faColors.ink.primary,
        ),
        children: [
          TextSpan(
            text:
                'Used for highlighting an active entity using selection surface colors.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 11,
              color: context.faColors.ink.secondary,
            ),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => _update(FaCodes.sampleChip),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: context.faColors.action.fill.selected,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: context.faColors.action.stroke.primary),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person,
                size: 14,
                color: context.faColors.action.ink.primary,
              ),
              const SizedBox(width: 6),
              Text(
                "Selected Chip",
                style: TextStyle(
                  color: context.faColors.action.ink.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSoftBadge(BuildContext context) {
    return Tooltip(
      message:
          'Soft State Badge:\nCompact label for secondary status indicators using subtle action colors.',
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: context.faColors.action.fill.selected,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          "SOFT BADGE",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: context.faColors.action.ink.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildTechHighlight(BuildContext context) {
    return Tooltip(
      message:
          'Technical Highlight:\nUsed for specialized triggers or system-level action icons.',
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.faColors.action.fill.highlight,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          Icons.bolt,
          color: context.faColors.action.ink.highlight,
          size: 18,
        ),
      ),
    );
  }

  Widget _btn(
    BuildContext context,
    String label,
    VoidCallback onTap, {
    bool isOutlined = false,
    bool isGhost = false,
    bool isDanger = false,
  }) {
    if (isGhost) return TextButton(onPressed: onTap, child: Text(label));
    if (isOutlined) return OutlinedButton(onPressed: onTap, child: Text(label));

    final bgColor = isDanger
        ? context.faColors.action.fill.danger
        : context.faColors.action.fill.primary;
    final textColor = isDanger
        ? context.faColors.action.ink.danger
        : context.faColors.action.ink.primary;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }
}
