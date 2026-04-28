part of '../../core.dart';

class ColorRowData {
  final String tokenName;
  final Color seedGeneratedColor;
  final Color? overrideColor;

  ColorRowData({
    required this.tokenName,
    required this.seedGeneratedColor,
    this.overrideColor,
  });

  String get seedHex =>
      '#${seedGeneratedColor.toARGB32().toRadixString(16).toUpperCase()}';

  String get overrideHex => overrideColor != null
      ? '#${overrideColor!.toARGB32().toRadixString(16).toUpperCase()}'
      : '---';
}

List<ColorRowData> getColorRowData(
  ColorScheme baseScheme,
  FaColorTokens colors,
) {
  final List<ColorRowData> rawList = [
    // --- Group A (Alphabetical Parent + onChild) ---
    _row("error", baseScheme.error, colors._error),
    _row("onError", baseScheme.onError, colors._onError),

    _row("inversePrimary", baseScheme.inversePrimary, colors._inversePrimary),
    _row("inverseSurface", baseScheme.inverseSurface, colors._inverseSurface),
    _row(
      "onInverseSurface",
      baseScheme.onInverseSurface,
      colors._onInverseSurface,
    ),

    _row("outline", baseScheme.outline, colors._outline),
    _row("outlineVariant", baseScheme.outlineVariant, colors._outlineVariant),

    _row("primary", baseScheme.primary, colors._primary),
    _row("onPrimary", baseScheme.onPrimary, colors._onPrimary),

    _row("scrim", baseScheme.scrim, colors._scrim),

    _row("secondary", baseScheme.secondary, colors._secondary),
    _row("onSecondary", baseScheme.onSecondary, colors._onSecondary),

    _row("shadow", baseScheme.shadow, colors._shadow),

    _row("surface", baseScheme.surface, colors._surface),
    _row("onSurface", baseScheme.onSurface, colors._onSurface),
    _row(
      "onSurfaceVariant",
      baseScheme.onSurfaceVariant,
      colors._onSurfaceVariant,
    ),

    _row(
      "surfaceContainer",
      baseScheme.surfaceContainer,
      colors._surfaceContainer,
    ),
    _row(
      "surfaceContainerHigh",
      baseScheme.surfaceContainerHigh,
      colors._surfaceContainerHigh,
    ),
    _row(
      "surfaceContainerHighest",
      baseScheme.surfaceContainerHighest,
      colors._surfaceContainerHighest,
    ),
    _row(
      "surfaceContainerLow",
      baseScheme.surfaceContainerLow,
      colors._surfaceContainerLow,
    ),
    _row(
      "surfaceContainerLowest",
      baseScheme.surfaceContainerLowest,
      colors._surfaceContainerLowest,
    ),

    _row("tertiary", baseScheme.tertiary, colors._tertiary),
    _row("onTertiary", baseScheme.onTertiary, colors._onTertiary),

    // --- Specialized / Semantic (Custom Tokens) ---
    _row("background", Colors.transparent, colors._background),
    _row("border", Colors.transparent, colors._border),
    _row("divider", Colors.transparent, colors._divider),
    _row("textPrimary", Colors.transparent, colors._textPrimary),
    _row("textSecondary", Colors.transparent, colors._textSecondary),
  ];
  return rawList;
}

ColorRowData _row(String name, Color seed, Color? override) => ColorRowData(
  tokenName: name,
  seedGeneratedColor: seed,
  overrideColor: override,
);
