part of '../core.dart';

class _FaThemeShortcut {
  final FaThemeTokens faTheme;

  _FaThemeShortcut(this.faTheme);

  Color get surfaceColor => faTheme.colors.surface;

  Color get onSurfaceColor => faTheme.colors.onSurface;

  double get borderRadius => faTheme.radius.borderRadius;

  double get elevation => faTheme.elevation.defaultValue;

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
}
