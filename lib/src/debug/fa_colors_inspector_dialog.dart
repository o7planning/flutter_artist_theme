import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_theme/src/debug/fa_colors/tabs/action_tab_content.dart';
import 'package:tabbed_view/tabbed_view.dart';

import '../utils/tab_theme_utils.dart';
import 'fa_colors/tabs/bar_tab_content.dart';
import 'fa_colors/tabs/input_tab_content.dart';
import 'fa_colors/tabs/navigation_tab_content.dart';
import 'fa_colors/tabs/others_tab_content.dart';
import 'fa_colors/tabs/selection_tab_content.dart';
import 'fa_colors/tabs/special_tab_content.dart';
import 'fa_colors/tabs/surface_tab_content.dart';
import 'fa_colors/tabs/typography_tab_content.dart';

class FaColorsInspectorDialog extends StatelessWidget {
  const FaColorsInspectorDialog({super.key});

  static Future<void> show(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (_) {
        return const FaColorsInspectorDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size preferSize = calculateDialogSize(
      context,
      preferredWidth: 1000,
      preferredHeight: 600,
    );

    return FaDialog(
      titleText: "Debug FaColors Inspector",
      iconData: Icons.palette_outlined,
      preferredContentWidth: preferSize.width,
      preferredContentHeight: preferSize.height,
      contentPadding: EdgeInsets.all(5),
      content: _buildTabSystem(context),
    );
  }

  Widget _buildTabSystem(BuildContext context) {
    List<TabData> tabs = [
      TabData(
        id: "Selection",
        text: 'Selection',
        view: const SelectionTabContent(),
        closable: false,
        draggable: false,
      ),
      TabData(
        id: "Action",
        text: 'Action',
        view: const ActionTabContent(),
        closable: false,
        draggable: false,
      ),
      TabData(
        id: "Surface",
        text: 'Surface',
        view: const SurfaceTabContent(),
        closable: false,
        draggable: false,
      ),
      TabData(
        id: "Bar",
        text: 'Bar',
        view: const BarTabContent(),
        closable: false,
        draggable: false,
      ),
      TabData(
        id: "Typography",
        text: 'Typography',
        view: const TypographyTabContent(),
        closable: false,
        draggable: false,
      ),
      TabData(
        id: "Input",
        text: 'Input',
        view: const InputTabContent(),
        closable: false,
        draggable: false,
      ),
      TabData(
        id: "Nav",
        text: 'Nav',
        view: const NavigationTabContent(),
        closable: false,
        draggable: false,
      ),
      TabData(
        id: "Special",
        text: 'Special',
        view: const SpecialTabContent(),
        closable: false,
        draggable: false,
      ),
      TabData(
        id: "Others",
        text: 'Others',
        view: const OthersTabContent(),
        closable: false,
        draggable: false,
      ),
    ];

    TabbedViewController controller = TabbedViewController(tabs);
    return TabbedViewTheme(
      data: TabThemeUtils.getTabbedViewThemeData(context),
      child: TabbedView(controller: controller),
    );
  }
}
