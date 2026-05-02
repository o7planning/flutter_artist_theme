import 'package:flutter/material.dart';

final SemanticColors = _SemanticColors();

/// ======================================================
/// ROOT API
/// ======================================================

class _SemanticColors {
  final button = SemanticButtonColors();

  final table = SemanticTableColors();

  final input = SemanticInputColors();

  final text = SemanticTextColors();

  final surface = SemanticSurfaceColors();

  final status = SemanticStatusColors();

  final navigation = SemanticNavigationColors();

  final divider = SemanticDividerColors();
}

/// ======================================================
/// COLOR GRAPH
/// ======================================================

class SemanticColorGraph {
  final ColorScheme scheme;

  SemanticColorGraph(this.scheme);

  // ======================================================
  // RAW COLORS
  // ======================================================

  Color get primary => scheme.primary;

  Color get onPrimary => scheme.onPrimary;

  Color get secondary => scheme.secondary;

  Color get onSecondary => scheme.onSecondary;

  Color get surface => scheme.surface;

  Color get onSurface => scheme.onSurface;

  Color get onSurfaceVariant => scheme.onSurfaceVariant;

  Color get error => scheme.error;

  Color get outline => scheme.outline;

  Color get outlineVariant => scheme.outlineVariant;

  // ======================================================
  // BUTTON
  // ======================================================

  Color buttonPrimarySurface() => primary;

  Color buttonPrimaryHover() => lighten(primary, 0.06);

  Color buttonPrimaryPressed() => darken(primary, 0.10);

  Color buttonSecondarySurface() => secondary;

  Color buttonGhostHover() => blend(primary, surface, 0.05);

  Color buttonGhostPressed() => blend(primary, surface, 0.09);

  // ======================================================
  // TABLE
  // ======================================================

  Color rowSelected() => blend(primary, surface, 0.14);

  Color rowHover() => blend(primary, surface, 0.07);

  Color rowPressed() => blend(primary, surface, 0.11);

  Color rowCurrent() => blend(primary, surface, 0.18);

  // ======================================================
  // INPUT
  // ======================================================

  Color inputBorder() => outlineVariant;

  Color inputBorderFocused() => primary;

  Color inputBorderHover() => blend(primary, outlineVariant, 0.25);

  Color inputFill() => blend(onSurface, surface, 0.025);

  // ======================================================
  // TEXT
  // ======================================================

  Color textPrimary() => onSurface;

  Color textSecondary() => onSurfaceVariant;

  Color textMuted() => blend(onSurfaceVariant, surface, 0.35);

  Color textOnPrimary() => onPrimary;

  // ======================================================
  // SURFACE
  // ======================================================

  Color surfaceHover() => blend(primary, surface, 0.04);

  Color surfacePressed() => blend(primary, surface, 0.08);

  Color surfaceMuted() => blend(onSurface, surface, 0.03);

  Color primarySoft() => blend(primary, surface, 0.12);

  // ======================================================
  // STATUS
  // ======================================================

  Color success() => Colors.green;

  Color warning() => Colors.orange;

  Color danger() => error;

  Color info() => primary;

  // ======================================================
  // HELPERS
  // ======================================================

  Color lighten(Color color, [double amount = 0.1]) {
    final hsl = HSLColor.fromColor(color);

    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  Color darken(Color color, [double amount = 0.1]) {
    final hsl = HSLColor.fromColor(color);

    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  Color blend(Color foreground, Color background, double amount) {
    return Color.lerp(background, foreground, amount)!;
  }
}

/// ======================================================
/// CONTEXT EXTENSION
/// ======================================================

extension SemanticColorContextExtension on BuildContext {
  SemanticColorGraph get faGraph {
    return SemanticColorGraph(Theme.of(this).colorScheme);
  }
}

/// ======================================================
/// RESOLVER TYPE
/// ======================================================

typedef SemanticColorResolver = Color Function(BuildContext context);

/// ======================================================
/// BUTTON RESOLVERS
/// ======================================================

class SemanticButtonColorResolver {
  static SemanticColorResolver primarySurface = (context) =>
      context.faGraph.buttonPrimarySurface();

  static SemanticColorResolver primaryHover = (context) =>
      context.faGraph.buttonPrimaryHover();

  static SemanticColorResolver primaryPressed = (context) =>
      context.faGraph.buttonPrimaryPressed();

  static SemanticColorResolver primaryText = (context) =>
      context.faGraph.onPrimary;

  static SemanticColorResolver secondarySurface = (context) =>
      context.faGraph.buttonSecondarySurface();

  static SemanticColorResolver secondaryText = (context) =>
      context.faGraph.onSecondary;

  static SemanticColorResolver ghostHover = (context) =>
      context.faGraph.buttonGhostHover();

  static SemanticColorResolver ghostPressed = (context) =>
      context.faGraph.buttonGhostPressed();
}

/// ======================================================
/// TABLE RESOLVERS
/// ======================================================

class SemanticTableColorResolver {
  static SemanticColorResolver rowSelected = (context) =>
      context.faGraph.rowSelected();

  static SemanticColorResolver rowHover = (context) =>
      context.faGraph.rowHover();

  static SemanticColorResolver rowPressed = (context) =>
      context.faGraph.rowPressed();

  static SemanticColorResolver rowCurrent = (context) =>
      context.faGraph.rowCurrent();
}

/// ======================================================
/// INPUT RESOLVERS
/// ======================================================

class SemanticInputColorResolver {
  static SemanticColorResolver border = (context) =>
      context.faGraph.inputBorder();

  static SemanticColorResolver borderFocused = (context) =>
      context.faGraph.inputBorderFocused();

  static SemanticColorResolver borderHover = (context) =>
      context.faGraph.inputBorderHover();

  static SemanticColorResolver fill = (context) => context.faGraph.inputFill();
}

/// ======================================================
/// TEXT RESOLVERS
/// ======================================================

class SemanticTextColorResolver {
  static SemanticColorResolver primary = (context) =>
      context.faGraph.textPrimary();

  static SemanticColorResolver secondary = (context) =>
      context.faGraph.textSecondary();

  static SemanticColorResolver muted = (context) => context.faGraph.textMuted();

  static SemanticColorResolver onPrimary = (context) =>
      context.faGraph.textOnPrimary();
}

/// ======================================================
/// SURFACE RESOLVERS
/// ======================================================

class SemanticSurfaceColorResolver {
  static SemanticColorResolver base = (context) => context.faGraph.surface;

  static SemanticColorResolver hover = (context) =>
      context.faGraph.surfaceHover();

  static SemanticColorResolver pressed = (context) =>
      context.faGraph.surfacePressed();

  static SemanticColorResolver muted = (context) =>
      context.faGraph.surfaceMuted();

  static SemanticColorResolver primarySoft = (context) =>
      context.faGraph.primarySoft();
}

/// ======================================================
/// STATUS RESOLVERS
/// ======================================================

class SemanticStatusColorResolver {
  static SemanticColorResolver success = (context) => context.faGraph.success();

  static SemanticColorResolver warning = (context) => context.faGraph.warning();

  static SemanticColorResolver danger = (context) => context.faGraph.danger();

  static SemanticColorResolver info = (context) => context.faGraph.info();
}

/// ======================================================
/// NAVIGATION RESOLVERS
/// ======================================================

class SemanticNavigationColorResolver {
  static SemanticColorResolver item = (context) =>
      context.faGraph.onSurfaceVariant;

  static SemanticColorResolver itemActive = (context) =>
      context.faGraph.primary;

  static SemanticColorResolver itemHover = (context) =>
      context.faGraph.surfaceHover();
}

/// ======================================================
/// DIVIDER RESOLVERS
/// ======================================================

class SemanticDividerColorResolver {
  static SemanticColorResolver subtle = (context) =>
      context.faGraph.outlineVariant;

  static SemanticColorResolver strong = (context) => context.faGraph.outline;
}

/// ======================================================
/// BUTTON API
/// ======================================================

class SemanticButtonColors {
  Color primarySurface(BuildContext context) =>
      SemanticButtonColorResolver.primarySurface(context);

  Color primaryHover(BuildContext context) =>
      SemanticButtonColorResolver.primaryHover(context);

  Color primaryPressed(BuildContext context) =>
      SemanticButtonColorResolver.primaryPressed(context);

  Color primaryText(BuildContext context) =>
      SemanticButtonColorResolver.primaryText(context);

  Color secondarySurface(BuildContext context) =>
      SemanticButtonColorResolver.secondarySurface(context);

  Color secondaryText(BuildContext context) =>
      SemanticButtonColorResolver.secondaryText(context);

  Color ghostHover(BuildContext context) =>
      SemanticButtonColorResolver.ghostHover(context);

  Color ghostPressed(BuildContext context) =>
      SemanticButtonColorResolver.ghostPressed(context);
}

/// ======================================================
/// TABLE API
/// ======================================================

class SemanticTableColors {
  Color rowSelected(BuildContext context) =>
      SemanticTableColorResolver.rowSelected(context);

  Color rowHover(BuildContext context) =>
      SemanticTableColorResolver.rowHover(context);

  Color rowPressed(BuildContext context) =>
      SemanticTableColorResolver.rowPressed(context);

  Color rowCurrent(BuildContext context) =>
      SemanticTableColorResolver.rowCurrent(context);
}

/// ======================================================
/// INPUT API
/// ======================================================

class SemanticInputColors {
  Color border(BuildContext context) =>
      SemanticInputColorResolver.border(context);

  Color borderFocused(BuildContext context) =>
      SemanticInputColorResolver.borderFocused(context);

  Color borderHover(BuildContext context) =>
      SemanticInputColorResolver.borderHover(context);

  Color fill(BuildContext context) => SemanticInputColorResolver.fill(context);
}

/// ======================================================
/// TEXT API
/// ======================================================

class SemanticTextColors {
  Color primary(BuildContext context) =>
      SemanticTextColorResolver.primary(context);

  Color secondary(BuildContext context) =>
      SemanticTextColorResolver.secondary(context);

  Color muted(BuildContext context) => SemanticTextColorResolver.muted(context);

  Color onPrimary(BuildContext context) =>
      SemanticTextColorResolver.onPrimary(context);
}

/// ======================================================
/// SURFACE API
/// ======================================================

class SemanticSurfaceColors {
  Color base(BuildContext context) =>
      SemanticSurfaceColorResolver.base(context);

  Color hover(BuildContext context) =>
      SemanticSurfaceColorResolver.hover(context);

  Color pressed(BuildContext context) =>
      SemanticSurfaceColorResolver.pressed(context);

  Color muted(BuildContext context) =>
      SemanticSurfaceColorResolver.muted(context);

  Color primarySoft(BuildContext context) =>
      SemanticSurfaceColorResolver.primarySoft(context);
}

/// ======================================================
/// STATUS API
/// ======================================================

class SemanticStatusColors {
  Color success(BuildContext context) =>
      SemanticStatusColorResolver.success(context);

  Color warning(BuildContext context) =>
      SemanticStatusColorResolver.warning(context);

  Color danger(BuildContext context) =>
      SemanticStatusColorResolver.danger(context);

  Color info(BuildContext context) => SemanticStatusColorResolver.info(context);
}

/// ======================================================
/// NAVIGATION API
/// ======================================================

class SemanticNavigationColors {
  Color item(BuildContext context) =>
      SemanticNavigationColorResolver.item(context);

  Color itemActive(BuildContext context) =>
      SemanticNavigationColorResolver.itemActive(context);

  Color itemHover(BuildContext context) =>
      SemanticNavigationColorResolver.itemHover(context);
}

/// ======================================================
/// DIVIDER API
/// ======================================================

class SemanticDividerColors {
  Color subtle(BuildContext context) =>
      SemanticDividerColorResolver.subtle(context);

  Color strong(BuildContext context) =>
      SemanticDividerColorResolver.strong(context);
}

/// ======================================================
/// USER OVERRIDE EXAMPLES
/// ======================================================

/// Example:
///
/// void main() {
///
///   SemanticTableColorResolver.rowSelected = (context) {
///     return Colors.red.withValues(alpha: 0.2);
///   };
///
///   SemanticButtonColorResolver.primarySurface = (context) {
///     return Theme.of(context).colorScheme.tertiary;
///   };
///
///   runApp(MyApp());
/// }
///
