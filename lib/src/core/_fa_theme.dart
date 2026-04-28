part of '../core.dart';

Typography getMaterialTypography() =>
    Typography.material2021(platform: defaultTargetPlatform);

/// ======================================================
/// FA THEME BASE
/// ======================================================

abstract class FaTheme {
  FaThemeTokens? _tokens;

  String get name;

  IconData get icon => Icons.palette;

  Brightness get brightness;

  String? get fontFamily;

  Color get seedColor => Colors.blue;

  FaThemeTokens get tokens {
    if (_tokens != null) {
      return _tokens!;
    }
    _tokens = createThemeTokens();
    return _tokens!;
  }

  /// Generate tokens
  FaThemeTokens createThemeTokens() {
    final colors = FaColorTokens.fromSeed(seedColor);

    return FaThemeTokens(
      colors: colors,
      spacing: const FaSpacingTokens(),
      radius: const FaRadiusTokens(),
      elevation: const FaElevationTokens(),
      typography: FaTypographyTokens(),
      components: const FaComponentTokens(),
      layout: FaLayoutTokens(
        metrics: const FaLayoutMetricsTokens(),
        colors: FaLayoutColorTokens.fromColorTokens(colors),
      ),
      motion: const FaMotionTokens(),
    );
  }
}

/// ======================================================
/// COLOR TOKENS
/// ======================================================

class FaColorTokens {
  // --- PRIVATE OVERRIDES ---
  final Color? _primary;
  final Color? _onPrimary;
  final Color? _secondary;
  final Color? _onSecondary;
  final Color? _tertiary;
  final Color? _onTertiary;
  final Color? _error;
  final Color? _onError;
  final Color? _background;
  final Color? _surface;
  final Color? _onSurface;
  final Color? _onSurfaceVariant;
  final Color? _surfaceContainerLowest;
  final Color? _surfaceContainerLow;
  final Color? _surfaceContainer;
  final Color? _surfaceContainerHigh;
  final Color? _surfaceContainerHighest;
  final Color? _textPrimary;
  final Color? _textSecondary;
  final Color? _border;
  final Color? _outline;
  final Color? _outlineVariant;
  final Color? _shadow;
  final Color? _scrim;
  final Color? _inverseSurface;
  final Color? _onInverseSurface;
  final Color? _inversePrimary;
  final Color? _divider;

  // --- LATE INITIALIZED SCHEME ---
  late final ColorScheme _scheme;

  FaColorTokens({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? tertiary,
    Color? onTertiary,
    Color? error,
    Color? onError,
    Color? background,
    Color? surface,
    Color? onSurface,
    Color? onSurfaceVariant,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? textPrimary,
    Color? textSecondary,
    Color? border,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? divider,
  }) : _primary = primary,
       _onPrimary = onPrimary,
       _secondary = secondary,
       _onSecondary = onSecondary,
       _tertiary = tertiary,
       _onTertiary = onTertiary,
       _error = error,
       _onError = onError,
       _background = background,
       _surface = surface,
       _onSurface = onSurface,
       _onSurfaceVariant = onSurfaceVariant,
       _surfaceContainerLowest = surfaceContainerLowest,
       _surfaceContainerLow = surfaceContainerLow,
       _surfaceContainer = surfaceContainer,
       _surfaceContainerHigh = surfaceContainerHigh,
       _surfaceContainerHighest = surfaceContainerHighest,
       _textPrimary = textPrimary,
       _textSecondary = textSecondary,
       _border = border,
       _outline = outline,
       _outlineVariant = outlineVariant,
       _shadow = shadow,
       _scrim = scrim,
       _inverseSurface = inverseSurface,
       _onInverseSurface = onInverseSurface,
       _inversePrimary = inversePrimary,
       _divider = divider;

  void _initDefault(ColorScheme scheme) {
    _scheme = scheme;
  }

  // --- PUBLIC SAFE GETTERS ---

  Color get primary => _primary ?? _scheme.primary;

  Color get onPrimary => _onPrimary ?? _scheme.onPrimary;

  Color get secondary => _secondary ?? _scheme.secondary;

  Color get onSecondary => _onSecondary ?? _scheme.onSecondary;

  Color get tertiary => _tertiary ?? _scheme.tertiary;

  Color get onTertiary => _onTertiary ?? _scheme.onTertiary;

  Color get error => _error ?? _scheme.error;

  Color get onError => _onError ?? _scheme.onError;

  Color get background => _background ?? _scheme.surface;

  Color get surface => _surface ?? _scheme.surface;

  Color get onSurface => _onSurface ?? _scheme.onSurface;

  Color get onSurfaceVariant => _onSurfaceVariant ?? _scheme.onSurfaceVariant;

  Color get surfaceContainerLowest =>
      _surfaceContainerLowest ?? _scheme.surfaceContainerLowest;

  Color get surfaceContainerLow =>
      _surfaceContainerLow ?? _scheme.surfaceContainerLow;

  Color get surfaceContainer => _surfaceContainer ?? _scheme.surfaceContainer;

  Color get surfaceContainerHigh =>
      _surfaceContainerHigh ?? _scheme.surfaceContainerHigh;

  Color get surfaceContainerHighest =>
      _surfaceContainerHighest ?? _scheme.surfaceContainerHighest;

  Color get textPrimary => _textPrimary ?? onSurface;

  Color get textSecondary => _textSecondary ?? onSurfaceVariant;

  Color get border => _border ?? _scheme.outline;

  Color get outline => _outline ?? _scheme.outline;

  Color get outlineVariant => _outlineVariant ?? _scheme.outlineVariant;

  Color get shadow => _shadow ?? _scheme.shadow;

  Color get scrim => _scrim ?? _scheme.scrim;

  Color get inverseSurface => _inverseSurface ?? _scheme.inverseSurface;

  Color get onInverseSurface => _onInverseSurface ?? _scheme.onInverseSurface;

  Color get inversePrimary => _inversePrimary ?? _scheme.inversePrimary;

  Color get divider => _divider ?? _scheme.outlineVariant;

  factory FaColorTokens.fromSeed(Color seed) => FaColorTokens();
}

/// ======================================================
/// SPACING TOKENS
/// ======================================================

class FaSpacingTokens {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  const FaSpacingTokens({
    this.xs = 4,
    this.sm = 8,
    this.md = 16,
    this.lg = 24,
    this.xl = 32,
  });
}

/// ======================================================
/// RADIUS TOKENS
/// ======================================================

class FaRadiusTokens {
  final double sm;
  final double md;
  final double lg;
  final double xl;

  const FaRadiusTokens({this.sm = 4, this.md = 8, this.lg = 12, this.xl = 16});

  double get borderRadius => md;
}

/// ======================================================
/// ELEVATION TOKENS
/// ======================================================

class FaElevationTokens {
  final double level1;
  final double level2;
  final double level3;

  const FaElevationTokens({this.level1 = 1, this.level2 = 3, this.level3 = 6});

  double get buttonElevation => level2;

  double get defaultValue => level2;
}

/// ======================================================
/// TYPOGRAPHY TOKENS
/// ======================================================

class FaTypographyTokens {
  // --- PRIVATE STORAGE FOR OVERRIDES ---
  final TextStyle? _displayLarge;
  final TextStyle? _displayMedium;
  final TextStyle? _displaySmall;

  final TextStyle? _headlineLarge;
  final TextStyle? _headlineMedium;
  final TextStyle? _headlineSmall;

  final TextStyle? _titleLarge;
  final TextStyle? _titleMedium;
  final TextStyle? _titleSmall;

  final TextStyle? _bodyLarge;
  final TextStyle? _bodyMedium;
  final TextStyle? _bodySmall;

  final TextStyle? _labelLarge;
  final TextStyle? _labelMedium;
  final TextStyle? _labelSmall;

  // --- LATE INITIALIZED DEFAULTS ---
  late final TextStyle _dDisplayLarge;
  late final TextStyle _dDisplayMedium;
  late final TextStyle _dDisplaySmall;

  late final TextStyle _dHeadlineLarge;
  late final TextStyle _dHeadlineMedium;
  late final TextStyle _dHeadlineSmall;

  late final TextStyle _dTitleLarge;
  late final TextStyle _dTitleMedium;
  late final TextStyle _dTitleSmall;

  late final TextStyle _dBodyLarge;
  late final TextStyle _dBodyMedium;
  late final TextStyle _dBodySmall;

  late final TextStyle _dLabelLarge;
  late final TextStyle _dLabelMedium;
  late final TextStyle _dLabelSmall;

  FaTypographyTokens({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
  }) : _displayLarge = displayLarge,
       _displayMedium = displayMedium,
       _displaySmall = displaySmall,
       _headlineLarge = headlineLarge,
       _headlineMedium = headlineMedium,
       _headlineSmall = headlineSmall,
       _titleLarge = titleLarge,
       _titleMedium = titleMedium,
       _titleSmall = titleSmall,
       _bodyLarge = bodyLarge,
       _bodyMedium = bodyMedium,
       _bodySmall = bodySmall,
       _labelLarge = labelLarge,
       _labelMedium = labelMedium,
       _labelSmall = labelSmall;

  // --- PUBLIC SAFE GETTERS ---
  TextStyle get displayLarge => _displayLarge ?? _dDisplayLarge;

  TextStyle get displayMedium => _displayMedium ?? _dDisplayMedium;

  TextStyle get displaySmall => _displaySmall ?? _dDisplaySmall;

  TextStyle get headlineLarge => _headlineLarge ?? _dHeadlineLarge;

  TextStyle get headlineMedium => _headlineMedium ?? _dHeadlineMedium;

  TextStyle get headlineSmall => _headlineSmall ?? _dHeadlineSmall;

  TextStyle get titleLarge => _titleLarge ?? _dTitleLarge;

  TextStyle get titleMedium => _titleMedium ?? _dTitleMedium;

  TextStyle get titleSmall => _titleSmall ?? _dTitleSmall;

  TextStyle get bodyLarge => _bodyLarge ?? _dBodyLarge;

  TextStyle get bodyMedium => _bodyMedium ?? _dBodyMedium;

  TextStyle get bodySmall => _bodySmall ?? _dBodySmall;

  TextStyle get labelLarge => _labelLarge ?? _dLabelLarge;

  TextStyle get labelMedium => _labelMedium ?? _dLabelMedium;

  TextStyle get labelSmall => _labelSmall ?? _dLabelSmall;

  void _initDefault(TextTheme base) {
    _dDisplayLarge = base.displayLarge!;
    _dDisplayMedium = base.displayMedium!;
    _dDisplaySmall = base.displaySmall!;

    _dHeadlineLarge = base.headlineLarge!;
    _dHeadlineMedium = base.headlineMedium!;
    _dHeadlineSmall = base.headlineSmall!;

    _dTitleLarge = base.titleLarge!;
    _dTitleMedium = base.titleMedium!;
    _dTitleSmall = base.titleSmall!;

    _dBodyLarge = base.bodyLarge!;
    _dBodyMedium = base.bodyMedium!;
    _dBodySmall = base.bodySmall!;

    _dLabelLarge = base.labelLarge!;
    _dLabelMedium = base.labelMedium!;
    _dLabelSmall = base.labelSmall!;
  }
}

/// ======================================================
/// COMPONENT TOKENS
/// ======================================================

class FaButtonTokens {
  final double height;
  final double radius;

  const FaButtonTokens({this.height = 40, this.radius = 8});
}

class FaCardTokens {
  final double radius;
  final double padding;

  const FaCardTokens({this.radius = 12, this.padding = 16});
}

class FaComponentTokens {
  final FaButtonTokens button;
  final FaCardTokens card;

  const FaComponentTokens({
    this.button = const FaButtonTokens(),
    this.card = const FaCardTokens(),
  });
}

/// ======================================================
/// LAYOUT TOKENS
/// ======================================================

class FaLayoutTokens {
  final FaLayoutMetricsTokens metrics;
  final FaLayoutColorTokens colors;

  const FaLayoutTokens({
    this.metrics = const FaLayoutMetricsTokens(),
    required this.colors,
  });
}

class FaLayoutMetricsTokens {
  final double sidebarWidth;
  final double? contentMaxWidth;

  const FaLayoutMetricsTokens({this.sidebarWidth = 260, this.contentMaxWidth});
}

class FaLayoutColorTokens {
  final Color sidebarSurface;
  final Color onSidebarSurface;

  final Color topbarSurface;
  final Color onTopbarSurface;

  const FaLayoutColorTokens({
    required this.sidebarSurface,
    required this.onSidebarSurface,
    required this.topbarSurface,
    required this.onTopbarSurface,
  });

  factory FaLayoutColorTokens.fromColorTokens(FaColorTokens colors) {
    return FaLayoutColorTokens(
      sidebarSurface: colors.surfaceContainerLow,
      onSidebarSurface: colors.onSurface,
      topbarSurface: colors.surface,
      onTopbarSurface: colors.onSurface,
    );
  }
}

/// ======================================================
/// MOTION TOKENS
/// ======================================================

class FaMotionTokens {
  final Duration fast;
  final Duration normal;
  final Duration slow;

  final Curve standard;
  final Curve emphasized;

  const FaMotionTokens({
    this.fast = const Duration(milliseconds: 120),
    this.normal = const Duration(milliseconds: 220),
    this.slow = const Duration(milliseconds: 360),
    this.standard = Curves.easeOut,
    this.emphasized = Curves.easeInOut,
  });
}
