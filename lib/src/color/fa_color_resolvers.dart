part of '_fa_color_sys.dart';

typedef FaColorResolver = Color Function(BuildContext context);

// --- Button Resolvers ---
class FaButtonSurfaceResolvers {
  static FaColorResolver primary = (c) => c.faGraph.btnPrimaryBase;
  static FaColorResolver secondary = (c) => c.faGraph.btnSecondaryBase;
  static FaColorResolver ghost = (c) => c.faGraph.btnGhostBase;
}

class FaButtonTextResolvers {
  static FaColorResolver primary = (c) => c.faGraph.textOnPrimary;
  static FaColorResolver secondary = (c) => c.faGraph.textOnSecondary;
  static FaColorResolver ghost = (c) => c.faGraph.textPrimary;
}

class FaButtonBorderResolvers {
  static FaColorResolver primary = (c) => c.faGraph.btnPrimaryBase;
  static FaColorResolver secondary = (c) => c.faGraph.btnSecondaryBase;
}

class FaButtonStateResolvers {
  static FaColorResolver hover = (c) => c.faGraph.btnPrimaryHover;
  static FaColorResolver pressed = (c) => c.faGraph.btnPrimaryPressed;
}

// --- Text Resolvers ---
class FaTextResolvers {
  static FaColorResolver primary = (c) => c.faGraph.textPrimary;
  static FaColorResolver secondary = (c) => c.faGraph.textSecondary;
  static FaColorResolver muted = (c) => c.faGraph.textMuted;
}

// --- Surface Resolvers ---
class FaSurfaceResolvers {
  static FaColorResolver base = (c) => c.faGraph.surfaceBase;
  static FaColorResolver container = (c) => c.faGraph.surfaceContainer;
  static FaColorResolver low = (c) => c.faGraph.surfaceLow;
  static FaColorResolver high = (c) => c.faGraph.surfaceHigh;
}

// --- Table Resolvers ---
class FaTableResolvers {
  static FaColorResolver rowSelected = (c) => c.faGraph.tableRowSelected;
  static FaColorResolver rowHover = (c) => c.faGraph.tableRowHover;
  static FaColorResolver rowPressed = (c) => c.faGraph.tableRowPressed;
  static FaColorResolver rowCurrent = (c) => c.faGraph.tableRowCurrent;
}

// --- Input Resolvers ---
class FaInputResolvers {
  static FaColorResolver background = (c) => c.faGraph.inputFill;
  static FaColorResolver border = (c) => c.faGraph.inputBorder;
  static FaColorResolver borderFocused = (c) => c.faGraph.inputBorderFocused;
}

// --- Navigation Resolvers ---
class FaNavResolvers {
  static FaColorResolver active = (c) => c.faGraph.navItemActive;
  static FaColorResolver inactive = (c) => c.faGraph.navItemInactive;
}

// --- Divider Resolvers ---
class FaDividerResolvers {
  static FaColorResolver subtle = (c) => c.faGraph.dividerSubtle;
  static FaColorResolver strong = (c) => c.faGraph.dividerStrong;
}

// --- Status Resolvers ---
class FaStatusResolvers {
  static FaColorResolver success = (c) => c.faGraph.success;
  static FaColorResolver warning = (c) => c.faGraph.warning;
  static FaColorResolver danger = (c) => c.faGraph.danger;
  static FaColorResolver info = (c) => c.faGraph.info;
}
