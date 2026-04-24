part of '../core.dart';

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final Size preferContentSize = calculateDialogSize(
      context,
      preferredWidth: 420,
      preferredHeight: 280,
    );

    return FaDialog(
      titleText: "Select Experience",
      iconData: Icons.palette_outlined,
      contentPadding: EdgeInsets.zero,
      preferredContentWidth: preferContentSize.width,
      preferredContentHeight: preferContentSize.height,
      content: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: FaThemeHub.instance._themeNameNotifier,
      builder: (BuildContext context, value, Widget? child) {
        final names = FaThemeHub.instance.availableThemeNames;
        final currentThemeName = FaThemeHub.instance.lastNotifyThemeName;

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 4),
          itemCount: names.length,
          itemBuilder: (context, index) {
            final name = names[index];
            final themeDef = FaThemeHub.instance.getThemeDefinition(name);
            final primary = themeDef.tokens.colors.primary;
            final isSelected = currentThemeName == name;
            return InkWell(
              onTap: () {
                FaThemeHub.instance.setThemeByName(name);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? primary.withValues(alpha: 0.12)
                      : Colors.transparent,
                  border: isSelected
                      ? Border(left: BorderSide(color: primary, width: 3.5))
                      : const Border(
                          left: BorderSide(
                            color: Colors.transparent,
                            width: 3.5,
                          ),
                        ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? primary.withValues(alpha: 0.2)
                            : Colors.grey.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.palette,
                        color: isSelected ? primary : Colors.grey,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: isSelected ? primary : null,
                        ),
                      ),
                    ),
                    if (isSelected)
                      Icon(Icons.check_circle, color: primary, size: 20)
                    else
                      Icon(
                        Icons.circle_outlined,
                        color: Colors.grey.withValues(alpha: 0.3),
                        size: 20,
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
