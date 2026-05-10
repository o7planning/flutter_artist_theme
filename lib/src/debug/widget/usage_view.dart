import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;

class UsageView extends StatelessWidget {
  final String htmlContentUrl;

  const UsageView({super.key, required this.htmlContentUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _fetchHtml(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: cupertino.CupertinoActivityIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: SelectableText(
              "Guide not available yet.\n${snapshot.error}",
              textAlign: TextAlign.center,
              style: TextStyle(color: context.faColors.ink.muted, fontSize: 12),
            ),
          );
        }

        final String primaryColor = ColorUtils.colorToHex(
          context.faColors.ink.primary,
        );
        final String textColor = ColorUtils.colorToHex(
          context.faColors.ink.primary,
        );
        final String infoTextColor = ColorUtils.colorToHex(
          context.faColors.ink.label,
        );
        final String codeBgColor = ColorUtils.colorToHex(
          context.faColors.surface.muted,
        );
        final String highlightColor = ColorUtils.colorToHex(
          context.faColors.special.highlight,
        );
        final String borderColor = ColorUtils.colorToHex(
          context.faColors.divider.subtle,
        );
        final String warningBgColor = ColorUtils.colorToHex(
          context.faColors.surface.muted,
        );
        final String dangerColor = ColorUtils.colorToHex(
          context.faColors.ink.danger,
        );

        return Container(
          color: context.faColors.surface.standard,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: SelectionArea(
              child: HtmlWidget(
                snapshot.data ?? "",
                textStyle: TextStyle(
                  fontSize: 13,
                  color: context.faColors.ink.primary,
                  height: 1.5,
                ),
                customStylesBuilder: (element) {
                  if (element.localName == 'h1') {
                    return {
                      'color': primaryColor,
                      'font-size': '18px',
                      'font-weight': 'bold',
                      'border-bottom': '1px solid $borderColor',
                      'padding-bottom': '4px',
                      'margin-bottom': '12px',
                    };
                  }
                  if (element.localName == 'h2') {
                    return {
                      'color': primaryColor,
                      'font-size': '16px',
                      'font-weight': 'bold',
                      'border-bottom': '1px solid $borderColor',
                      'padding-bottom': '4px',
                      'margin-bottom': '12px',
                    };
                  }
                  if (element.localName == 'h3') {
                    return {
                      'color': primaryColor,
                      'font-size': '14px',
                      'font-weight': 'bold',
                      'border-bottom': '1px solid $borderColor',
                      'padding-bottom': '4px',
                      'margin-bottom': '12px',
                    };
                  }
                  if (element.className == 'warning-box') {
                    return {
                      'background-color': warningBgColor,
                      'color': textColor,
                      'padding': '12px',
                      'border-left': '4px solid $dangerColor',
                      'border-radius': '4px',
                      'margin': '16px 0',
                    };
                  }
                  if (element.localName == 'code') {
                    return {
                      'color': highlightColor,
                      'background-color': codeBgColor,
                      'padding': '2px 4px',
                      'border-radius': '4px',
                      'font-family': 'monospace',
                      'font-weight': 'bold',
                    };
                  }
                  if (element.localName == 'b' ||
                      element.localName == 'strong') {
                    return {'color': primaryColor};
                  }
                  if (element.localName == 'i') {
                    return {'color': infoTextColor};
                  }
                  if (element.localName == 'li') {
                    return {'margin-bottom': '8px'};
                  }
                  return null;
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Future<String> _fetchHtml() async {
    final response = await http.get(Uri.parse(htmlContentUrl));
    if (response.statusCode == 200) return response.body;
    throw Exception("404 Not Found");
  }
}
