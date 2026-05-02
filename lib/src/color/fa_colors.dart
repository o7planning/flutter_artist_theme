part of '_fa_color_sys.dart';

final FaColors = _FaColors();

/// ===========================================================================
/// ROOT API (The Usage Layer with Sub-Namespaces)
/// ===========================================================================

class _FaColors {
  final common = _FaCommonNamespace();
  final text = _FaTextNamespace();
  final button = _FaButtonNamespace();
  final surface = _FaSurfaceNamespace();
  final table = _FaTableNamespace();
  final input = _FaInputNamespace();
  final status = _FaStatusNamespace();
  final divider = _FaDividerNamespace();
}

class _FaButtonNamespace {
  final surface = _FaButtonSurfaceSubNamespace();
  final text = _FaButtonTextSubNamespace();
  final border = _FaButtonBorderSubNamespace();

  Color hover(BuildContext context) => FaButtonStateResolvers.hover(context);

  Color pressed(BuildContext context) =>
      FaButtonStateResolvers.pressed(context);
}

class _FaButtonSurfaceSubNamespace {
  Color primary(BuildContext context) =>
      FaButtonSurfaceResolvers.primary(context);

  Color secondary(BuildContext context) =>
      FaButtonSurfaceResolvers.secondary(context);

  Color ghost(BuildContext context) => FaButtonSurfaceResolvers.ghost(context);
}

class _FaButtonTextSubNamespace {
  Color primary(BuildContext context) => FaButtonTextResolvers.primary(context);

  Color secondary(BuildContext context) =>
      FaButtonTextResolvers.secondary(context);

  Color ghost(BuildContext context) => FaButtonTextResolvers.ghost(context);
}

class _FaButtonBorderSubNamespace {
  Color primary(BuildContext context) =>
      FaButtonBorderResolvers.primary(context);

  Color secondary(BuildContext context) =>
      FaButtonBorderResolvers.secondary(context);
}

class _FaTextNamespace {
  Color primary(BuildContext context) => FaTextResolvers.primary(context);

  Color secondary(BuildContext context) => FaTextResolvers.secondary(context);

  Color muted(BuildContext context) => FaTextResolvers.muted(context);
}

class _FaSurfaceNamespace {
  Color base(BuildContext context) => FaSurfaceResolvers.base(context);

  Color container(BuildContext context) =>
      FaSurfaceResolvers.container(context);

  Color low(BuildContext context) => FaSurfaceResolvers.low(context);

  Color high(BuildContext context) => FaSurfaceResolvers.high(context);
}

class _FaTableNamespace {
  Color rowSelected(BuildContext context) =>
      FaTableResolvers.rowSelected(context);

  Color rowHover(BuildContext context) => FaTableResolvers.rowHover(context);

  Color rowPressed(BuildContext context) =>
      FaTableResolvers.rowPressed(context);

  Color rowCurrent(BuildContext context) =>
      FaTableResolvers.rowCurrent(context);
}

class _FaInputNamespace {
  Color background(BuildContext context) =>
      FaInputResolvers.background(context);

  Color border(BuildContext context) => FaInputResolvers.border(context);

  Color focused(BuildContext context) =>
      FaInputResolvers.borderFocused(context);
}

class _FaStatusNamespace {
  Color success(BuildContext context) => FaStatusResolvers.success(context);

  Color warning(BuildContext context) => FaStatusResolvers.warning(context);

  Color danger(BuildContext context) => FaStatusResolvers.danger(context);

  Color info(BuildContext context) => FaStatusResolvers.info(context);
}

class _FaCommonNamespace {
  Color white(BuildContext context) => Colors.white;

  Color black(BuildContext context) => Colors.black;

  Color transparent(BuildContext context) => Colors.transparent;
}

class _FaDividerNamespace {
  Color subtle(BuildContext context) => FaDividerResolvers.subtle(context);

  Color strong(BuildContext context) => FaDividerResolvers.strong(context);
}
