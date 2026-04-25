part of '../core.dart';

class FaThemeTokens extends ThemeExtension<FaThemeTokens> {
  final FaColorTokens colors;
  final FaSpacingTokens spacing;
  final FaRadiusTokens radius;
  final FaElevationTokens elevation;
  final FaTypographyTokens typography;
  final FaComponentTokens components;
  final FaLayoutTokens layout;
  final FaMotionTokens motion;

  late final _FaThemeShortcut shortcut = _FaThemeShortcut(this);

  FaThemeTokens({
    required this.colors,
    required this.spacing,
    required this.radius,
    required this.elevation,
    required this.typography,
    required this.components,
    required this.layout,
    required this.motion,
  });

  @override
  FaThemeTokens copyWith({
    FaColorTokens? colors,
    FaSpacingTokens? spacing,
    FaRadiusTokens? radius,
    FaElevationTokens? elevation,
    FaTypographyTokens? typography,
    FaComponentTokens? components,
    FaLayoutTokens? layout,
    FaLayoutColorTokens? layoutColors,
    FaMotionTokens? motion,
  }) {
    return FaThemeTokens(
      colors: colors ?? this.colors,
      spacing: spacing ?? this.spacing,
      radius: radius ?? this.radius,
      elevation: elevation ?? this.elevation,
      typography: typography ?? this.typography,
      components: components ?? this.components,
      layout: layout ?? this.layout,
      motion: motion ?? this.motion,
    );
  }

  @override
  FaThemeTokens lerp(covariant ThemeExtension<FaThemeTokens>? other, double t) {
    if (other is! FaThemeTokens) return this;

    return FaThemeTokens(
      colors: _lerpColors(colors, other.colors, t),
      spacing: _lerpSpacing(spacing, other.spacing, t),
      radius: _lerpRadius(radius, other.radius, t),
      elevation: _lerpElevation(elevation, other.elevation, t),
      typography: other.typography,
      components: other.components,
      layout: _lerpLayout(layout, other.layout, t),
      motion: other.motion,
    );
  }

  FaColorTokens _lerpColors(FaColorTokens a, FaColorTokens b, double t) {
    return FaColorTokens(
      primary: Color.lerp(a.primary, b.primary, t),
      onPrimary: Color.lerp(a.onPrimary, b.onPrimary, t),
      secondary: Color.lerp(a.secondary, b.secondary, t),
      onSecondary: Color.lerp(a.onSecondary, b.onSecondary, t),
      tertiary: Color.lerp(a.tertiary, b.tertiary, t),
      onTertiary: Color.lerp(a.onTertiary, b.onTertiary, t),
      error: Color.lerp(a.error, b.error, t),
      onError: Color.lerp(a.onError, b.onError, t),
      background: Color.lerp(a.background, b.background, t),
      surface: Color.lerp(a.surface, b.surface, t),
      onSurface: Color.lerp(a.onSurface, b.onSurface, t),
      onSurfaceVariant: Color.lerp(a.onSurfaceVariant, b.onSurfaceVariant, t),
      surfaceContainerLowest: Color.lerp(
        a.surfaceContainerLowest,
        b.surfaceContainerLowest,
        t,
      ),
      surfaceContainerLow: Color.lerp(
        a.surfaceContainerLow,
        b.surfaceContainerLow,
        t,
      ),
      surfaceContainer: Color.lerp(a.surfaceContainer, b.surfaceContainer, t),
      surfaceContainerHigh: Color.lerp(
        a.surfaceContainerHigh,
        b.surfaceContainerHigh,
        t,
      ),
      surfaceContainerHighest: Color.lerp(
        a.surfaceContainerHighest,
        b.surfaceContainerHighest,
        t,
      ),
      textPrimary: Color.lerp(a.textPrimary, b.textPrimary, t),
      textSecondary: Color.lerp(a.textSecondary, b.textSecondary, t),
      border: Color.lerp(a.border, b.border, t),
      outline: Color.lerp(a.outline, b.outline, t),
      outlineVariant: Color.lerp(a.outlineVariant, b.outlineVariant, t),
      shadow: Color.lerp(a.shadow, b.shadow, t),
      scrim: Color.lerp(a.scrim, b.scrim, t),
      inverseSurface: Color.lerp(a.inverseSurface, b.inverseSurface, t),
      onInverseSurface: Color.lerp(a.onInverseSurface, b.onInverseSurface, t),
      inversePrimary: Color.lerp(a.inversePrimary, b.inversePrimary, t),
      divider: Color.lerp(a.divider, b.divider, t),
    );
  }

  FaSpacingTokens _lerpSpacing(FaSpacingTokens a, FaSpacingTokens b, double t) {
    return FaSpacingTokens(
      xs: lerpDouble(a.xs, b.xs, t)!,
      sm: lerpDouble(a.sm, b.sm, t)!,
      md: lerpDouble(a.md, b.md, t)!,
      lg: lerpDouble(a.lg, b.lg, t)!,
      xl: lerpDouble(a.xl, b.xl, t)!,
    );
  }

  FaRadiusTokens _lerpRadius(FaRadiusTokens a, FaRadiusTokens b, double t) {
    return FaRadiusTokens(
      sm: lerpDouble(a.sm, b.sm, t)!,
      md: lerpDouble(a.md, b.md, t)!,
      lg: lerpDouble(a.lg, b.lg, t)!,
      xl: lerpDouble(a.xl, b.xl, t)!,
    );
  }

  FaElevationTokens _lerpElevation(
    FaElevationTokens a,
    FaElevationTokens b,
    double t,
  ) {
    return FaElevationTokens(
      level1: lerpDouble(a.level1, b.level1, t)!,
      level2: lerpDouble(a.level2, b.level2, t)!,
      level3: lerpDouble(a.level3, b.level3, t)!,
    );
  }

  FaLayoutTokens _lerpLayout(FaLayoutTokens a, FaLayoutTokens b, double t) {
    return FaLayoutTokens(
      metrics: FaLayoutMetricsTokens(
        sidebarWidth: lerpDouble(
          a.metrics.sidebarWidth,
          b.metrics.sidebarWidth,
          t,
        )!,
        contentMaxWidth: lerpDouble(
          a.metrics.contentMaxWidth,
          b.metrics.contentMaxWidth,
          t,
        ),
      ),
      colors: FaLayoutColorTokens(
        sidebarSurface: Color.lerp(
          a.colors.sidebarSurface,
          b.colors.sidebarSurface,
          t,
        )!,
        onSidebarSurface: Color.lerp(
          a.colors.onSidebarSurface,
          b.colors.onSidebarSurface,
          t,
        )!,
        topbarSurface: Color.lerp(
          a.colors.topbarSurface,
          b.colors.topbarSurface,
          t,
        )!,
        onTopbarSurface: Color.lerp(
          a.colors.onTopbarSurface,
          b.colors.onTopbarSurface,
          t,
        )!,
      ),
    );
  }
}
