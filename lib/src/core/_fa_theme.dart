part of '../core.dart';

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
      typography: const FaTypographyTokens(
        body: TextStyle(fontSize: 14),
        title: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        caption: TextStyle(fontSize: 12),
      ),
      components: const FaComponentTokens(),
      layout: const FaLayoutTokens(),
      layoutColors: FaLayoutColorTokens.fromColors(colors),
      motion: const FaMotionTokens(),
    );
  }
}

/// ======================================================
/// COLOR TOKENS
/// ======================================================

class FaColorTokens {
  final Brightness brightness;

  final Color? divider;
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;

  final Color error;
  final Color onError;

  final Color background;
  final Color surface;

  final Color onSurface;
  final Color onSurfaceVariant;

  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;

  final Color textPrimary;
  final Color textSecondary;

  final Color border;
  final Color outlineVariant;

  final Color tertiary;
  final Color onTertiary;

  final Color outline;

  final Color shadow;
  final Color scrim;

  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;

  const FaColorTokens({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,

    required this.tertiary,
    required this.onTertiary,

    required this.error,
    required this.onError,

    required this.background,
    required this.surface,

    required this.onSurface,
    required this.onSurfaceVariant,

    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,

    required this.textPrimary,
    required this.textSecondary,

    required this.border,
    required this.outline,
    required this.outlineVariant,

    required this.shadow,
    required this.scrim,

    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,

    this.divider,
  });

  factory FaColorTokens.fromSeed(Color seed) {
    final scheme = ColorScheme.fromSeed(seedColor: seed);

    return FaColorTokens(
      brightness: scheme.brightness,

      primary: scheme.primary,
      onPrimary: scheme.onPrimary,

      secondary: scheme.secondary,
      onSecondary: scheme.onSecondary,

      tertiary: scheme.tertiary,
      onTertiary: scheme.onTertiary,

      error: scheme.error,
      onError: scheme.onError,

      background: scheme.surface,
      surface: scheme.surface,

      onSurface: scheme.onSurface,
      onSurfaceVariant: scheme.onSurfaceVariant,

      surfaceContainerLowest: scheme.surfaceContainerLowest,
      surfaceContainerLow: scheme.surfaceContainerLow,
      surfaceContainer: scheme.surfaceContainer,
      surfaceContainerHigh: scheme.surfaceContainerHigh,
      surfaceContainerHighest: scheme.surfaceContainerHighest,

      textPrimary: scheme.onSurface,
      textSecondary: scheme.onSurfaceVariant,

      border: scheme.outline,
      outline: scheme.outline,
      outlineVariant: scheme.outlineVariant,

      shadow: scheme.shadow,
      scrim: scheme.scrim,

      inverseSurface: scheme.inverseSurface,
      onInverseSurface: scheme.onInverseSurface,
      inversePrimary: scheme.inversePrimary,

      divider: scheme.outlineVariant,
    );
  }
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

  double get elevation => level2;
}

/// ======================================================
/// TYPOGRAPHY TOKENS
/// ======================================================

class FaTypographyTokens {
  final TextStyle body;
  final TextStyle title;
  final TextStyle caption;

  const FaTypographyTokens({
    required this.body,
    required this.title,
    required this.caption,
  });

  TextTheme? toTextTheme(FaColorTokens colors) {
    return null; // TODO.
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
  final double sidebarWidth;
  final double contentMaxWidth;

  const FaLayoutTokens({this.sidebarWidth = 260, this.contentMaxWidth = 1200});
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

  factory FaLayoutColorTokens.fromColors(FaColorTokens colors) {
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

/// ======================================================
/// THEME TOKENS ROOT
/// ======================================================

class _FaThemeShortcut {
  final FaThemeTokens faTheme;

  _FaThemeShortcut(this.faTheme);

  Color get surfaceColor => faTheme.colors.surface;

  Color get onSurfaceColor => faTheme.colors.onSurface;

  double get borderRadius => faTheme.radius.borderRadius;

  double get elevation => faTheme.elevation.elevation;

  BorderSide get border => BorderSide(color: faTheme.colors.border, width: 1);

  List<BoxShadow>? get cardShadows {
    final elevation = faTheme.elevation.level2;

    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.08),
        blurRadius: elevation * 2,
        offset: Offset(0, elevation),
      ),
    ];
  }

  TextStyle get headerTextStyle {
    return faTheme.typography.title.copyWith(
      color: onSurfaceColor,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.2,
    );
  }

  TextStyle get bodyTextStyle {
    return faTheme.typography.body.copyWith(
      color: onSurfaceColor.withValues(alpha: 0.8),
    );
  }
}
