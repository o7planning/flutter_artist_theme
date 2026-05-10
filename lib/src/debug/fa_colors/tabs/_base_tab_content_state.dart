import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_left_right_container/left_right_container.dart';
import 'package:tabbed_view/tabbed_view.dart';

import '../../../_endpoint.dart';
import '../../../utils/tab_theme_utils.dart';
import '../../widget/code_detail_view.dart';
import '../../widget/fa_color_code_table.dart';
import '../../widget/usage_view.dart';

abstract class FaColorsBaseTabContentState<W extends StatefulWidget>
    extends State<W> {
  TabbedViewController? _leftController;
  TabbedViewController? _rightController;

  String getTabUsageUrl() {
    return "$faColorsBaseURL/selection/selection-en.html";
  }

  String getSelectedRowUsageUrl(String? token) {
    return "$faColorsBaseURL/selection/$token-en.html";
  }

  String? _selectedToken;

  String getCurrentCode();

  String getDescription();

  Widget buildGallery(BuildContext context);

  List<MapEntry<String, Color>> getColorCodeData();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_leftController == null) {
      _leftController = TabbedViewController(_getLeftTabs());
    } else {
      _leftController!.setTabs(_getLeftTabs());
    }

    if (_rightController == null) {
      _rightController = TabbedViewController(_getRightTabs());
    } else {
      int currentIndex = _rightController!.selectedIndex ?? 0;
      _rightController!.setTabs(_getRightTabs());
      _rightController!.selectedIndex = currentIndex;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _leftController?.dispose();
    _rightController?.dispose();
  }

  List<TabData> _getLeftTabs() {
    return [
      TabData(
        id: "tokens",
        text: 'Tokens',
        view: Column(
          children: [
            _buildDescription(context),
            const SizedBox(height: 10),
            Expanded(
              child: FaColorCodeTable(
                data: getColorCodeData(),
                onRowTap: _onTokenSelected,
              ),
            ),
          ],
        ),
        closable: false,
        draggable: false,
      ),
      TabData(
        id: "guide",
        text: 'Guide',
        view: UsageView(htmlContentUrl: getTabUsageUrl()),
        closable: false,
      ),
    ];
  }

  List<TabData> _getRightTabs() {
    return [
      TabData(
        id: "preview",
        text: 'Live Preview',
        view: Column(
          children: [
            Expanded(flex: 7, child: buildGallery(context)),
            Divider(height: 1, color: context.faColors.divider.subtle),
            Expanded(flex: 3, child: CodeDetailView(code: getCurrentCode())),
          ],
        ),
        closable: false,
      ),
      TabData(
        id: "docs",
        text: 'Token Docs',
        view: UsageView(htmlContentUrl: getSelectedRowUsageUrl(_selectedToken)),
        closable: false,
      ),
    ];
  }

  void _onTokenSelected(String token) {
    setState(() {
      _selectedToken = token;
      _rightController?.setTabs(_getRightTabs());
      _rightController?.selectedIndex = 1;
    });
  }

  Widget _buildLeftTabSystem() {
    return TabbedViewTheme(
      data: TabThemeUtils.getTabbedViewThemeData(context),
      child: TabbedView(controller: _leftController!),
    );
  }

  Widget _buildRightTabSystem() {
    return TabbedViewTheme(
      data: TabThemeUtils.getTabbedViewThemeData(context),
      child: TabbedView(controller: _rightController!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LeftRightContainer(
      fixedSizeWidth: 420,
      minSideWidth: 350,
      fixedSide: FixedSide.start,
      spacing: 8,
      style: LeftRightContainerStyle(
        startPadding: const EdgeInsets.all(0),
        endPadding: const EdgeInsets.all(0),
      ),
      showVerticalDivider: true,
      start: _buildLeftTabSystem(),
      end: _buildRightTabSystem(),
    );
  }

  Widget _buildDescription(BuildContext context) {
    final desc = getDescription();
    if (desc.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: context.faColors.surface.muted,
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(color: context.faColors.special.highlight, width: 4),
        ),
      ),
      child: SelectableText(
        desc,
        style: TextStyle(
          fontSize: 13,
          color: context.faColors.ink.secondary,
          height: 1.5,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget buildGroup(BuildContext context, String title, List<Widget> children) {
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
        Wrap(spacing: 10, runSpacing: 10, children: children),
      ],
    );
  }

  Widget ink(BuildContext context, Widget child, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: child,
    );
  }
}
