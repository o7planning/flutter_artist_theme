import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '_base_tab_content_state.dart';

class OthersTabContent extends StatefulWidget {
  const OthersTabContent({super.key});

  @override
  State<OthersTabContent> createState() => _OthersTabContentState();
}

class _OthersTabContentState
    extends FaColorsBaseTabContentState<OthersTabContent> {
  String _currentCode = "// Explore dividers and common utility colors.";

  @override
  List<MapEntry<String, Color>> getColorCodeData() {
    final div = context.faColors.divider;
    final com = context.faColors.common;
    return [
      MapEntry("faColors.divider.subtle", div.subtle),
      MapEntry("faColors.divider.strong", div.strong),
      MapEntry("faColors.common.white", com.white),
      MapEntry("faColors.common.black", com.black),
      MapEntry("faColors.common.transparent", com.transparent),
    ];
  }

  @override
  String getDescription() {
    return "Other Namespace contains structural separators (Dividers) and utility constants (Common). "
        "Subtle dividers are for internal content, while Strong dividers define major sections.";
  }

  @override
  String getCurrentCode() => _currentCode;

  @override
  Widget buildGallery(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildGroup(context, "Dividers in Context", [
          const Text(
            "Section A",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Divider(color: context.faColors.divider.subtle, thickness: 1),
          const Text("Section B (Sub-item)", style: TextStyle(fontSize: 11)),
          const SizedBox(height: 16),
          _barHeader(context, "Major Section Break"),
          Divider(
            color: context.faColors.divider.strong,
            thickness: 2,
            height: 1,
          ),
        ]),
        const SizedBox(height: 24),
        _buildGroup(context, "Common Utilities", [
          Wrap(
            spacing: 12,
            children: [
              _colorCircle(context, "White", context.faColors.common.white),
              _colorCircle(context, "Black", context.faColors.common.black),
            ],
          ),
        ]),
      ],
    );
  }

  Widget _barHeader(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: context.faColors.bar.primary,
      child: Text(
        title,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _colorCircle(BuildContext context, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: context.faColors.divider.subtle),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _buildGroup(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: context.faColors.ink.label,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }
}
