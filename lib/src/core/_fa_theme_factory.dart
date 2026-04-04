part of '../core.dart';

/// ======================================================
/// THEME FACTORY
/// ======================================================

class FaThemeFactory {
  static ThemeData create(FaTheme theme) {
    final colors = theme.tokens.colors;
    final layoutColors = theme.tokens.layoutColors;
    final typography = theme.tokens.typography;
    final radius = theme.tokens.radius;

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
        backgroundColor: layoutColors.topbarSurface,
        foregroundColor: layoutColors.onTopbarSurface,
        elevation: 0,
      ),

      scaffoldBackgroundColor: colors.surfaceContainerLowest,

      tabBarTheme: TabBarThemeData(
        labelColor: colors.primary,
        unselectedLabelColor: colors.onSurfaceVariant,
        indicatorColor: colors.primary,
      ),

      textTheme: typography.toTextTheme(colors),

      extensions: [theme.tokens],
    );
  }
}
