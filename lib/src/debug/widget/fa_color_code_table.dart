import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

import '../../utils/davi_table_utils.dart';
import '../_build_helper.dart';

class FaColorCodeTable extends StatelessWidget {
  final List<MapEntry<String, Color>> data;
  final String tokenHeaderName;
  final ValueChanged<String>? onRowTap;
  final ScrollController _controller = ScrollController();

  FaColorCodeTable({
    super.key,
    required this.data,
    this.tokenHeaderName = 'Token',
    this.onRowTap,
  });

  @override
  Widget build(BuildContext context) {
    final model = DaviModel<MapEntry<String, Color>>(
      rows: data,
      columns: [
        DaviColumn(
          name: tokenHeaderName,
          cellValue: (row) => row.data.key,
          grow: 1,
        ),
        DaviColumn(
          name: 'Preview',
          width: 60,
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          resizable: false,
          cellWidget: (params) => Tooltip(
            message: "context.${params.data.key}",
            child: buildColorPreview(params.data.value),
          ),
        ),
        DaviColumn(
          name: 'Hex',
          headerAlignment: Alignment.centerLeft,
          cellAlignment: Alignment.center,
          width: 110,
          resizable: false,
          cellWidget: (params) => buildHexCell(
            context,
            '#${params.data.value.value.toRadixString(16).toUpperCase()}',
          ),
        ),
      ],
    );
    return DaviTheme(
      data: getDemoDaviTableThemeData(context, currentItemIndex: -1),
      child: Material(
        type: MaterialType.transparency,
        child: Davi<MapEntry<String, Color>>(
          verticalScrollController: _controller,
          model,
          onRowTap: (row) {
            if (onRowTap != null) {
              onRowTap!(row.key);
            }
          },
        ),
      ),
    );
  }
}
