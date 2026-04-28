part of '../../core.dart';

class ColorTabContent extends StatefulWidget {
  const ColorTabContent({super.key});

  @override
  State<ColorTabContent> createState() => _ColorTabContentState();
}

class _ColorTabContentState extends State<ColorTabContent> {
  late DaviModel<ColorRowData> _model;

  @override
  void initState() {
    super.initState();
    _refreshModel();
  }

  void _refreshModel() {
    FaTheme faTheme = FaThemeHub.instance.getCurrentTheme();
    final tokens = faTheme.tokens;
    final colors = tokens.colors;

    final ColorScheme baseScheme = ColorScheme.fromSeed(
      seedColor: faTheme.seedColor,
      brightness: faTheme.brightness,
    );
    final List<ColorRowData> rows = getColorRowData(baseScheme, colors);

    _model = DaviModel<ColorRowData>(
      rows: rows,
      columns: [
        DaviColumn(
          name: 'Property Name',
          cellValue: (row) => row.data.tokenName,
          grow: 2,
        ),
        DaviColumn(
          name: 'Seed Color',
          width: 120,
          cellWidget: (params) =>
              buildColorPreview(params.data.seedGeneratedColor),
        ),
        DaviColumn(
          name: 'Seed Hex',
          width: 120,
          cellWidget: (params) => buildHexCell(context, params.data.seedHex),
        ),
        DaviColumn(
          name: 'Override Color',
          width: 120,
          cellWidget: (params) => params.data.overrideColor != null
              ? buildColorPreview(params.data.overrideColor!)
              : const Center(child: Text("")),
        ),
        DaviColumn(
          name: 'Override Hex',
          width: 120,
          cellWidget: (params) => params.data.overrideHex != '---'
              ? buildHexCell(context, params.data.overrideHex)
              : const Center(child: Text("")),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DaviTheme(
      data: getDemoDaviTableThemeData(context, currentItemIndex: -1),
      child: Davi<ColorRowData>(_model),
    );
  }
}
