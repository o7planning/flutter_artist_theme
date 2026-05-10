import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;

class UsageDialog extends StatelessWidget {
  final String title;
  final String htmlContentUrl;

  const UsageDialog({
    super.key,
    required this.title,
    required this.htmlContentUrl,
  });

  static void show(
    BuildContext context, {
    required String title,
    required String htmlContentUrl,
  }) {
    showDialog(
      context: context,
      builder: (context) =>
          UsageDialog(title: title, htmlContentUrl: htmlContentUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size preferContentSize = calculateDialogSize(
      context,
      preferredWidth: 600,
      preferredHeight: 400,
    );

    return FaDialog(
      titleText: "Usage Guide: $title",
      iconData: Icons.menu_book_outlined,
      contentPadding: const EdgeInsets.all(12),
      preferredContentWidth: preferContentSize.width,
      preferredContentHeight: preferContentSize.height,
      content: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return FutureBuilder<String>(
      future: _fetchHtml(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error loading guide: ${snapshot.error}"));
        }

        // Render HTML content
        return SingleChildScrollView(
          child: HtmlWidget(
            snapshot.data ?? "No content available.",
            textStyle: TextStyle(
              color: context.faColors.ink.primary,
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }

  Future<String> _fetchHtml() async {
    final response = await http.get(Uri.parse(htmlContentUrl));
    if (response.statusCode == 200) return response.body;
    throw Exception("Failed to load HTML (Status: ${response.statusCode})");
  }
}
