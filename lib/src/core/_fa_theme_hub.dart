part of '../core.dart';

/// Central registry responsible for:
///
/// - Registering available themes
/// - Caching generated ThemeData
/// - Providing themes by name
class FaThemeHub {
  FaThemeHub._() {
    register(DefaultTheme());
    register(DefaultProTheme());
  }

  static const String defaultThemeName = "Default";
  static const String defaultProThemeName = "Default Pro";

  static final FaThemeHub instance = FaThemeHub._();

  void addThemeListener(VoidCallback listener) {
    _themeNameNotifier.addListener(listener);
  }

  String get lastNotifyThemeName => _themeNameNotifier.value;

  /// Notifier used for runtime theme switching
  final ValueNotifier<String> _themeNameNotifier = ValueNotifier(
    defaultThemeName,
  );

  /// Registered theme definitions
  final Map<String, FaTheme> _registeredThemes = {};

  /// Cached ThemeData instances
  final Map<String, ThemeData> _themeCache = {};

  /// Current theme name
  String get currentThemeName => _themeNameNotifier.value;

  /// Listen for theme changes
  ValueListenable<String> get themeNotifier => _themeNameNotifier;

  /// Register a new theme
  void register(FaTheme theme) {
    _registeredThemes[theme.name] = theme;

    /// Invalidate cache
    _themeCache.remove(theme.name);
  }

  /// Register multiple themes
  void registerAll(List<FaTheme> themes) {
    for (final theme in themes) {
      register(theme);
    }
  }

  /// Change active theme
  void setThemeByName(String name) {
    if (!_registeredThemes.containsKey(name)) return;

    if (_themeNameNotifier.value != name) {
      _themeNameNotifier.value = name;
    }
  }

  /// Get theme definition
  FaTheme getThemeDefinition(String name) {
    return _registeredThemes[name] ??
        _registeredThemes[defaultThemeName] ??
        (throw Exception("No themes registered."));
  }

  /// Get current theme definition
  FaTheme getCurrentTheme() {
    return getThemeDefinition(_themeNameNotifier.value);
  }

  ThemeData getCurrentThemeData() {
    final theme = getCurrentTheme();

    return _themeCache.putIfAbsent(
      theme.name,
      () => FaThemeFactory.create(theme),
    );
  }

  ThemeData getThemeData(String name) {
    final theme = getThemeDefinition(name);

    return _themeCache.putIfAbsent(
      theme.name,
      () => FaThemeFactory.create(theme),
    );
  }

  /// All registered theme names
  List<String> get availableThemeNames =>
      _registeredThemes.keys.toList(growable: false);

  /// All theme definitions
  List<FaTheme> get themes => _registeredThemes.values.toList(growable: false);
}
