import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../_endpoint.dart';
import '_base_tab_content_state.dart';

class SurfaceTabContent extends StatefulWidget {
  const SurfaceTabContent({super.key});

  @override
  State<SurfaceTabContent> createState() => _SurfaceTabContentState();
}

class _SurfaceTabContentState
    extends FaColorsBaseTabContentState<SurfaceTabContent> {
  String _currentCode =
      "// Select a surface component to see its implementation.";

  void _update(String code) => setState(() => _currentCode = code);

  @override
  String getTabUsageUrl() {
    return "$faColorsBaseURL/surface/faColors.surface-en.html";
  }

  @override
  String getSelectedRowUsageUrl(String? token) {
    return "$faColorsBaseURL/surface/$token-en.html";
  }

  @override
  List<MapEntry<String, Color>> getColorCodeData() {
    final s = context.faColors.surface;
    return [
      MapEntry("faColors.surface.ground", s.ground),
      MapEntry("faColors.surface.low", s.subtle),
      MapEntry("faColors.surface.muted", s.muted),
      MapEntry("faColors.surface.standard", s.standard),
      MapEntry("faColors.surface.emphasized", s.emphasized),
      MapEntry("faColors.surface.strong", s.strong),
    ];
  }

  @override
  String getCurrentCode() {
    return _currentCode;
  }

  @override
  String getDescription() {
    return "Surface Namespace manages the structural layers of the UI. "
        "Surfaces define elevation and depth.";
  }

  @override
  Widget buildGallery(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        buildGroup(context, "Application Surfaces (Z-Index Hierarchy)", [
          _surfaceBox(
            context,
            "Ground Surface",
            context.faColors.surface.ground,
            "Scaffold background layer.",
          ),
          _surfaceBox(
            context,
            "Subtle Surface",
            context.faColors.surface.subtle,
            "Subtle layers or backgrounds.", // TODO: Review Desc?
          ),
          _surfaceBox(
            context,
            "Muted Surface",
            context.faColors.surface.muted,
            "Sunken layers or backgrounds.", // TODO: Review Desc?
          ),
          _surfaceBox(
            context,
            "Standard",
            context.faColors.surface.standard,
            "Standard card/dialog background.", // TODO: Review Desc?
          ),
          _surfaceBox(
            context,
            "Emphasized Surface",
            context.faColors.surface.emphasized,
            "Floating or elevated elements.", // TODO: Review Desc?
          ),
          _surfaceBox(
            context,
            "Strong Surface",
            context.faColors.surface.strong,
            "Floating or elevated elements.", // TODO: Review Desc?
          ),
        ]),
      ],
    );
  }

  Widget _surfaceBox(
    BuildContext context,
    String label,
    Color color,
    String desc,
  ) {
    final code =
        "Container(\n  color: context.faColors.surface.${label.toLowerCase().split(' ')[0]},\n  child: const Text('$label'),\n)";
    return InkWell(
      onTap: () => _update(code),
      child: Tooltip(
        message: desc,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.faColors.divider.subtle),
          ),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: context.faColors.ink.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.layers_outlined,
                size: 16,
                color: context.faColors.ink.muted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
