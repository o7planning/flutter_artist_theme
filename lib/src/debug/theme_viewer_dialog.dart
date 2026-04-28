import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_theme/src/debug/tabs/general_tab_content.dart';
import 'package:flutter_artist_theme/src/debug/tabs/others_tab_content.dart';
import 'package:tabbed_view/tabbed_view.dart';

import '../../flutter_artist_theme.dart';
import '../utils/tab_theme_utils.dart';
import 'tabs/component_tab_content.dart';
import 'tabs/layout_tab_content.dart';

class ThemeViewerDialog extends StatelessWidget {
  const ThemeViewerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final Size preferSize = calculateDialogSize(
      context,
      preferredWidth: 1000,
      preferredHeight: 600,
    );

    return FaDialog(
      titleText: "Debug Theme Viewer",
      iconData: Icons.bug_report_outlined,
      preferredContentWidth: preferSize.width,
      preferredContentHeight: preferSize.height,
      contentPadding: EdgeInsets.all(5),
      content: _buildTabSystem(context),
    );
  }

  Widget _buildTabSystem(BuildContext context) {
    List<TabData> tabs = [
      TabData(
        id: "General",
        text: 'General',
        view: const GeneralTabContent(),
        closable: false,
      ),
      TabData(
        id: "Colors",
        text: 'Colors',
        view: const ColorTabContent(),
        closable: false,
      ),
      TabData(
        id: 'Typography',
        text: 'Typography',
        view: const TypographyTabContent(),
        closable: false,
      ),
      TabData(
        id: 'Layout',
        text: 'Layout',
        view: const LayoutTabContent(),
        closable: false,
      ),
      TabData(
        id: 'Components',
        text: 'Components',
        view: const ComponentTabContent(),
        closable: false,
      ),
      TabData(
        id: 'Others',
        text: 'Others',
        view: const OthersTabContent(),
        closable: false,
      ),
    ];

    TabbedViewController controller = TabbedViewController(tabs);
    return TabbedViewTheme(
      data: TabThemeUtils.getTabbedViewThemeData(context),
      child: TabbedView(controller: controller),
    );
  }
}
