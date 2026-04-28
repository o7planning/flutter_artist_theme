import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

DaviThemeData getDemoDaviTableThemeData(
  BuildContext context, {
  required int currentItemIndex,
  List<int> selectedItemIndexes = const [],
}) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;

  return DaviThemeData(
    columnDividerThickness: 0.4,
    columnDividerFillHeight: true,
    decoration: BoxDecoration(
      border: Border.all(width: 0.2, color: theme.dividerColor),
      color: theme.colorScheme.surface,
    ),
    header: HeaderThemeData(
      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      bottomBorderColor: theme.dividerColor,
    ),
    headerCell: HeaderCellThemeData(
      padding: const EdgeInsets.all(5),
      height: 35,
      textStyle: TextStyle(
        color: FaColorUtils.sectionHeader(context),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    ),
    row: RowThemeData(
      dividerThickness: 0.4,
      dividerColor: theme.dividerColor,
      fillHeight: true,
      color: (int row) {
        if (row == currentItemIndex) {
          return FaColorUtils.selectedRowBackground(context);
        }
        if (selectedItemIndexes.contains(row)) {
          return FaColorUtils.selectedRowBackground(
            context,
          ).withValues(alpha: 0.4);
        }
        return null;
      },
      hoverBackground: (int row) {
        return FaColorUtils.selectedRowBackground(
          context,
        ).withValues(alpha: 0.3);
      },
    ),
    cell: CellThemeData(
      padding: const EdgeInsets.all(5),
      contentHeight: 32,
      textStyle: TextStyle(color: colorScheme.onSurface, fontSize: 13),
    ),
    scrollbar: TableScrollbarThemeData(
      thickness: 8,
      radius: const Radius.circular(4),
      thumbColor: FaColorUtils.primaryAction(context).withValues(alpha: 0.3),
    ),
  );
}
