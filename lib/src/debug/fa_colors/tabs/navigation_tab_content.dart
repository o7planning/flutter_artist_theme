import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '_base_tab_content_state.dart';

class NavigationTabContent extends StatefulWidget {
  const NavigationTabContent({super.key});

  @override
  State<NavigationTabContent> createState() => _NavigationTabContentState();
}

class _NavigationTabContentState
    extends FaColorsBaseTabContentState<NavigationTabContent> {
  String _currentCode =
      "// Click on a component above to see the FaColors usage.";

  void _update(String code) => setState(() => _currentCode = code);

  @override
  List<MapEntry<String, Color>> getColorCodeData() {
    final nav = context.faColors.nav;
    return [
      MapEntry("faColors.nav.active", nav.active),
      MapEntry("faColors.nav.inactive", nav.inactive),
    ];
  }

  @override
  String getDescription() {
    return "Navigation tokens manage the contrast between active and idle states in menus. "
        "Active items should use the Primary color, while inactive items stay subtle.";
  }

  @override
  Widget buildGallery(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _navItem(context, Icons.home, "Home", true),
          const SizedBox(width: 32),
          _navItem(context, Icons.settings, "Settings", false),
        ],
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    IconData icon,
    String label,
    bool active,
  ) {
    final color = active
        ? context.faColors.nav.active
        : context.faColors.nav.inactive;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        Text(label, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }

  @override
  String getCurrentCode() {
    return _currentCode;
  }
}
