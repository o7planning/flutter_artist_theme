part of '../core.dart';

/// ======================================================
/// THEME FACTORY
/// ======================================================

class FaThemeFactory {
  static ThemeData create(FaTheme theme) {
    final seedColorScheme = ColorScheme.fromSeed(
      seedColor: theme.seedColor,
      brightness: theme.brightness,
    );
    theme.tokens.colors._initDefault(seedColorScheme);

    final colors = theme.tokens.colors;
    final typography = theme.tokens.typography;
    final radius = theme.tokens.radius;
    final layout = theme.tokens.layout;

    final textTheme = _buildTextTheme(theme.brightness, colors, typography);

    final colorScheme = ColorScheme(
      brightness: theme.brightness,
      primary: colors.primary,

      onPrimary: colors.onPrimary,
      secondary: colors.secondary,

      onSecondary: colors.onSecondary,

      tertiary: colors.tertiary,
      onTertiary: colors.onTertiary,
      error: colors.error,
      onError: colors.onError,
      surface: colors.surface,
      onSurface: colors.onSurface,

      surfaceContainerLowest: colors.surfaceContainerLowest,
      surfaceContainerLow: colors.surfaceContainerLow,
      surfaceContainer: colors.surfaceContainer,
      surfaceContainerHigh: colors.surfaceContainerHigh,
      surfaceContainerHighest: colors.surfaceContainerHighest,

      onSurfaceVariant: colors.onSurfaceVariant,

      outline: colors.outline,
      outlineVariant: colors.outlineVariant,

      shadow: colors.shadow,
      scrim: colors.scrim,

      inverseSurface: colors.inverseSurface,
      onInverseSurface: colors.onInverseSurface,
      inversePrimary: colors.inversePrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: theme.brightness,
      fontFamily: theme.fontFamily,

      colorScheme: colorScheme,

      dividerTheme: DividerThemeData(
        color: colors.divider,
        thickness: 0.5,
        space: 1,
      ),

      cardTheme: CardThemeData(
        color: colors.surfaceContainerLow,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.md),
          side: BorderSide(color: colors.outlineVariant, width: 0.5),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceContainerLow,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.sm),
          borderSide: BorderSide(color: colors.outlineVariant),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.sm),
          borderSide: BorderSide(color: colors.outlineVariant),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.sm),
          borderSide: BorderSide(color: colors.primary, width: 1.2),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.sm),
          borderSide: BorderSide(color: colors.error),
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: layout.colors.topbarSurface,
        foregroundColor: layout.colors.onTopbarSurface,
        elevation: 0,
      ),

      scaffoldBackgroundColor: colors.surfaceContainerLowest,

      tabBarTheme: TabBarThemeData(
        labelColor: colors.primary,
        unselectedLabelColor: colors.onSurfaceVariant,
        indicatorColor: colors.primary,
      ),

      textTheme: textTheme,

      extensions: [theme.tokens],
    );
  }

  static TextTheme _buildTextTheme(
    Brightness brightness,
    FaColorTokens colors,
    FaTypographyTokens typography,
  ) {
    final Typography materialTypography = getMaterialTypography();
    final TextTheme base = brightness == Brightness.dark
        ? materialTypography.white
        : materialTypography.black;

    typography._initDefault(base);

    return base
        .copyWith(
          // Only override if the value in tokens is not null
          displayLarge: typography._displayLarge ?? base.displayLarge,
          displayMedium: typography._displayMedium ?? base.displayMedium,
          displaySmall: typography._displaySmall ?? base.displaySmall,

          headlineLarge: typography._headlineLarge ?? base.headlineLarge,
          headlineMedium: typography._headlineMedium ?? base.headlineMedium,
          headlineSmall: typography._headlineSmall ?? base.headlineSmall,

          titleLarge: typography._titleLarge ?? base.titleLarge,
          titleMedium: typography._titleMedium ?? base.titleMedium,
          titleSmall: typography._titleSmall ?? base.titleSmall,

          bodyLarge: typography._bodyLarge ?? base.bodyLarge,
          bodyMedium: typography._bodyMedium ?? base.bodyMedium,
          bodySmall: typography._bodySmall ?? base.bodySmall,

          labelLarge: typography._labelLarge ?? base.labelLarge,
          labelMedium: typography._labelMedium ?? base.labelMedium,
          labelSmall: typography._labelSmall ?? base.labelSmall,
        )
        .apply(
          // Ensure text colors always have good contrast with the surface
          bodyColor: colors.onSurface,
          displayColor: colors.onSurface,
        );
  }
}
