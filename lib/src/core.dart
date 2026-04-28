import 'dart:ui';

import 'package:davi/davi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_theme/src/utils/davi_table_utils.dart';

import 'debug/model/typography_row_data.dart';
import 'debug/tabs/_build_helper.dart';
import 'debug/theme_viewer_dialog.dart';
import 'default_pro_theme.dart';
import 'default_theme.dart';

part 'core/_fa_theme.dart';
part 'core/_fa_theme_factory.dart';
part 'core/_fa_theme_hub.dart';
part 'core/_fa_theme_shortcut.dart';
part 'core/_fa_theme_tokens.dart';
part 'core/_theme_extension.dart';
part 'debug/model/color_row_data.dart';
part 'debug/tabs/color_tab_content.dart';
part 'debug/tabs/typography_tab_content.dart';
part 'dialog/_theme_dialog.dart';

typedef FaThemeBuilder = Widget Function(BuildContext context, ThemeData theme);

class FlutterArtistTheme extends StatelessWidget {
  final FaThemeBuilder builder;

  const FlutterArtistTheme({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: FaThemeHub.instance.themeNotifier,
      builder: (context, themeName, child) {
        final themeData = FaThemeHub.instance.getThemeData(themeName);
        return builder(context, themeData);
      },
    );
  }

  static Future<void> showSelectionDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (_) {
        return const ThemeDialog();
      },
    );
  }

  static Future<void> showDebugDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (_) {
        return const ThemeViewerDialog();
      },
    );
  }
}
