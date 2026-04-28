part of '../../core.dart';

class TypographyTabContent extends StatefulWidget {
  const TypographyTabContent({super.key});

  @override
  State<TypographyTabContent> createState() => _TypographyTabContentState();
}

class _TypographyTabContentState extends State<TypographyTabContent> {
  bool _showAll = true;

  @override
  Widget build(BuildContext context) {
    final FaTheme faTheme = FaThemeHub.instance.getCurrentTheme();
    final ThemeData rawMaterialTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: faTheme.seedColor,
        brightness: faTheme.brightness,
      ),
      useMaterial3: true,
    );

    // Đây chính là bộ TextTheme "vằng vặc" thông số mà Flutter đã tính toán xong
    final TextTheme materialBase = rawMaterialTheme.textTheme;

    // Get the textTheme that has already been rendered
    final TextTheme currentTextTheme = Theme.of(context).textTheme;

    final tokens = faTheme.tokens;
    final typography = tokens.typography;
    final Typography materialTypography = getMaterialTypography();

    // Use the Material's default TextTheme
    // (without any Artist modifications) as a benchmark for comparison.
    // final TextTheme materialBase = faTheme.brightness == Brightness.dark
    //     ? materialTypography.white
    //     : materialTypography.black;

    return Column(
      children: [
        _buildToolbar(),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              _buildGroup("Display", [
                _rowData(
                  "displayLarge",
                  typography._displayLarge,
                  currentTextTheme.displayLarge!,
                  materialBase.displayLarge!,
                ),
                _rowData(
                  "displayMedium",
                  typography._displayMedium,
                  currentTextTheme.displayMedium!,
                  materialBase.displayMedium!,
                ),
                _rowData(
                  "displaySmall",
                  typography._displaySmall,
                  currentTextTheme.displaySmall!,
                  materialBase.displaySmall!,
                ),
              ]),
              _buildGroup("Headline", [
                _rowData(
                  "headlineLarge",
                  typography._headlineLarge,
                  currentTextTheme.headlineLarge!,
                  materialBase.headlineLarge!,
                ),
                _rowData(
                  "headlineMedium",
                  typography._headlineMedium,
                  currentTextTheme.headlineMedium!,
                  materialBase.headlineMedium!,
                ),
                _rowData(
                  "headlineSmall",
                  typography._headlineSmall,
                  currentTextTheme.headlineSmall!,
                  materialBase.headlineSmall!,
                ),
              ]),
              _buildGroup("Title", [
                _rowData(
                  "titleLarge",
                  typography._titleLarge,
                  currentTextTheme.titleLarge!,
                  materialBase.titleLarge!,
                ),
                _rowData(
                  "titleMedium",
                  typography._titleMedium,
                  currentTextTheme.titleMedium!,
                  materialBase.titleMedium!,
                ),
                _rowData(
                  "titleSmall",
                  typography._titleSmall,
                  currentTextTheme.titleSmall!,
                  materialBase.titleSmall!,
                ),
              ]),
              _buildGroup("Body", [
                _rowData(
                  "bodyLarge",
                  typography._bodyLarge,
                  currentTextTheme.bodyLarge!,
                  materialBase.bodyLarge!,
                ),
                _rowData(
                  "bodyMedium",
                  typography._bodyMedium,
                  currentTextTheme.bodyMedium!,
                  materialBase.bodyMedium!,
                ),
                _rowData(
                  "bodySmall",
                  typography._bodySmall,
                  currentTextTheme.bodySmall!,
                  materialBase.bodySmall!,
                ),
              ]),
              _buildGroup("Label", [
                _rowData(
                  "labelLarge",
                  typography._labelLarge,
                  currentTextTheme.labelLarge!,
                  materialBase.labelLarge!,
                ),
                _rowData(
                  "labelMedium",
                  typography._labelMedium,
                  currentTextTheme.labelMedium!,
                  materialBase.labelMedium!,
                ),
                _rowData(
                  "labelSmall",
                  typography._labelSmall,
                  currentTextTheme.labelSmall!,
                  materialBase.labelSmall!,
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStyleRow(TypographyRowData row) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: context.faTokens.colors.divider.withValues(alpha: 0.5),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      row.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    if (row.isOverride) ...[
                      const SizedBox(width: 8),
                      _buildOverrideTag(context, row),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  row.getInfo(row.style), // Dùng helper để lấy text sạch
                  style: TextStyle(
                    fontSize: 12,
                    color: context.faTokens.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "The quick brown fox",
              style: row.style,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverrideTag(BuildContext context, TypographyRowData row) {
    return GestureDetector(
      onTap: () => _showComparisonDialog(context, row),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "OVERRIDE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.info_outline, color: Colors.white, size: 12),
          ],
        ),
      ),
    );
  }

  void _showComparisonDialog(BuildContext context, TypographyRowData row) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Original: ${row.name}"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Material Default Style:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey.withValues(alpha: 0.1),
              child: Text(
                "The quick brown fox",
                style: row.baseStyle, // Show text với style gốc
              ),
            ),
            const SizedBox(height: 12),
            Text(
              row.getInfo(row.baseStyle),
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  TypographyRowData _rowData(
    String name,
    TextStyle? override,
    TextStyle current,
    TextStyle base,
  ) {
    final faTheme = FaThemeHub.instance.getCurrentTheme();
    // Lấy bộ khung chuẩn của Material theo Brightness
    final Typography platformTypography = Typography.material2021(
      platform: defaultTargetPlatform,
    );
    final TextTheme platformBase = faTheme.brightness == Brightness.dark
        ? platformTypography.white
        : platformTypography.black;

    // TUYỆT CHIÊU CUỐI: Lấy style chuẩn từ Platform,
    // sau đó dùng .copyWith() để "ép" nó phải mang giá trị thực.
    final TextStyle platformStyle = _getPlatformStyleByName(platformBase, name);

    // Ép kiểu resolved để lấy được con số M3 chuẩn (như 57.0, 32.0...)
    final TextStyle resolvedBase = platformStyle.copyWith();

    return TypographyRowData(
      name: name,
      style: current,
      isOverride: override != null,
      baseStyle: resolvedBase,
    );
  }

  // Hàm bổ trợ để lấy style theo tên từ TextTheme
  TextStyle _getPlatformStyleByName(TextTheme theme, String name) {
    switch (name) {
      case 'displayLarge':
        return theme.displayLarge!;
      case 'displayMedium':
        return theme.displayMedium!;
      case 'displaySmall':
        return theme.displaySmall!;
      case 'headlineLarge':
        return theme.headlineLarge!;
      case 'headlineMedium':
        return theme.headlineMedium!;
      case 'headlineSmall':
        return theme.headlineSmall!;
      case 'titleLarge':
        return theme.titleLarge!;
      case 'titleMedium':
        return theme.titleMedium!;
      case 'titleSmall':
        return theme.titleSmall!;
      case 'bodyLarge':
        return theme.bodyLarge!;
      case 'bodyMedium':
        return theme.bodyMedium!;
      case 'bodySmall':
        return theme.bodySmall!;
      case 'labelLarge':
        return theme.labelLarge!;
      case 'labelMedium':
        return theme.labelMedium!;
      case 'labelSmall':
        return theme.labelSmall!;
      default:
        return const TextStyle();
    }
  }

  // TypographyRowData _rowData(
  //   String name,
  //   TextStyle? override,
  //   TextStyle current,
  //   TextStyle base,
  // ) {
  //   // Merge base into an empty TextStyle with all base attributes
  //   // This ensures the base no longer contains 'virtual' null values
  //   final TextStyle resolvedBase = TextStyle(
  //     fontSize: base.fontSize,
  //     fontWeight: base.fontWeight,
  //     letterSpacing: base.letterSpacing,
  //     fontFamily: base.fontFamily,
  //     height: base.height,
  //   ).merge(base);
  //
  //   return TypographyRowData(
  //     name: name,
  //     style: current,
  //     isOverride: override != null,
  //     baseStyle: resolvedBase,
  //   );
  // }

  Widget _buildToolbar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: context.faTokens.colors.surfaceContainerLow,
        border: Border(
          bottom: BorderSide(color: context.faTokens.colors.divider),
        ),
      ),
      child: Row(
        children: [
          const Text(
            "Show all styles (including non-override)",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Switch(
            value: _showAll,
            onChanged: (v) => setState(() => _showAll = v),
          ),
        ],
      ),
    );
  }

  Widget _buildGroup(String groupName, List<TypographyRowData> rows) {
    final filteredRows = _showAll
        ? rows
        : rows.where((r) => r.isOverride).toList();
    if (filteredRows.isEmpty) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          groupName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: filteredRows.map((row) => _buildStyleRow(row)).toList(),
      ),
    );
  }
}
