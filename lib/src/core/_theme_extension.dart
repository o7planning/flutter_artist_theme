part of '../core.dart';

extension FaThemeGetter on BuildContext {
  // FaThemeTokens get faTokens =>
  //     Theme.of(this).extension<FaThemeTokens>() ??
  //     FaThemeHub.instance.getDefaultThemeTokens();

  FaThemeTokens get faTokens {
    final FaTheme faTheme = FaThemeHub.instance.getCurrentTheme();
    return faTheme.tokens;
  }
}
