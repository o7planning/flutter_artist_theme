part of '_fa_color_sys.dart';

/// ===========================================================================
/// COLOR GRAPH (The Logic Layer)
/// ===========================================================================
/// Maps Theme colors to semantic use cases with smart adjustments.
class FaColorGraph {
  final ColorScheme scheme;
  final Brightness brightness;

  FaColorGraph(this.scheme, this.brightness);

  /// Helper to check if the current theme is Dark Mode.
  bool get isDark => brightness == Brightness.dark;

  // ===========================================================================
  // INTERACTION HELPERS
  // ===========================================================================

  /// Intelligent hover color adjustment based on brightness.
  Color _hover(Color base) => isDark
      ? FaColorTransform.lighten(base, 0.08)
      : FaColorTransform.darken(base, 0.05);

  /// Intelligent pressed color adjustment based on brightness.
  Color _pressed(Color base) => isDark
      ? FaColorTransform.lighten(base, 0.15)
      : FaColorTransform.darken(base, 0.12);

  // ===========================================================================
  // TEXT & CONTENT
  // ===========================================================================

  Color get textPrimary => scheme.onSurface;

  Color get textSecondary => scheme.onSurfaceVariant;

  Color get textMuted => scheme.onSurfaceVariant.withValues(alpha: 0.6);

  Color get textOnPrimary => scheme.onPrimary;

  Color get textOnSecondary => scheme.onSecondary;

  // ===========================================================================
  // SURFACE & LAYOUT
  // ===========================================================================

  /// Main background (e.g., Scaffold).
  Color get surfaceBase => scheme.surface;

  /// Default container (e.g., Cards, Sections).
  Color get surfaceContainer => scheme.surfaceContainer;

  /// Low emphasis container surface.
  Color get surfaceLow => scheme.surfaceContainerLow;

  /// High emphasis container surface.
  Color get surfaceHigh => scheme.surfaceContainerHigh;

  /// Highest emphasis container surface.
  Color get surfaceHighest => scheme.surfaceContainerHighest;

  /// Subtle hover effect for large surfaces.
  Color get surfaceHover =>
      FaColorTransform.blend(scheme.primary, scheme.surface, 0.04);

  // ===========================================================================
  // BUTTONS & ACTIONS
  // ===========================================================================

  // Primary Action
  Color get btnPrimaryBase => scheme.primary;

  Color get btnPrimaryHover => _hover(scheme.primary);

  Color get btnPrimaryPressed => _pressed(scheme.primary);

  // Secondary Action
  Color get btnSecondaryBase => scheme.secondary;

  // Ghost/Plain Action
  Color get btnGhostBase =>
      FaColorTransform.blend(scheme.primary, scheme.surface, 0.08);

  // Action Surfaces (Small Elements like Chips/Badges)
  Color get actionPrimaryBase => scheme.primary;

  Color get actionSecondaryBase => scheme.secondary;

  Color get actionGhostHover =>
      FaColorTransform.blend(scheme.primary, scheme.surface, 0.08);

  // ===========================================================================
  // DATA TABLES
  // ===========================================================================

  Color get tableRowSelected =>
      FaColorTransform.blend(scheme.primary, scheme.surface, 0.14);

  Color get tableRowHover =>
      FaColorTransform.blend(scheme.primary, scheme.surface, 0.07);

  Color get tableRowPressed =>
      FaColorTransform.blend(scheme.primary, scheme.surface, 0.20);

  Color get tableRowCurrent =>
      FaColorTransform.blend(scheme.secondary, scheme.surface, 0.15);

  // ===========================================================================
  // INPUTS & FORMS
  // ===========================================================================

  Color get inputFill =>
      FaColorTransform.blend(scheme.onSurface, scheme.surface, 0.025);

  Color get inputBorder => scheme.outlineVariant;

  Color get inputBorderFocused => scheme.primary;

  // ===========================================================================
  // NAVIGATION & DIVIDERS
  // ===========================================================================

  Color get navItemActive => scheme.primary;

  Color get navItemInactive => scheme.onSurfaceVariant;

  Color get dividerSubtle => scheme.outlineVariant.withValues(alpha: 0.5);

  Color get dividerStrong => scheme.outline;

  // ===========================================================================
  // STATUS & ALERTS
  // ===========================================================================

  Color get success =>
      isDark ? const Color(0xFF81C784) : const Color(0xFF388E3C);

  Color get warning =>
      isDark ? const Color(0xFFFFB74D) : const Color(0xFFF57C00);

  Color get danger => scheme.error;

  Color get info => scheme.primary;
}
