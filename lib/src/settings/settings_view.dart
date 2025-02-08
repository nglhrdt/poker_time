import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              spacing: 32,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${AppLocalizations.of(context)!.themeSettings}:',
                    style: Theme.of(context).textTheme.titleLarge),
                Expanded(
                  child: DropdownButton<ThemeMode>(
                    value: controller.themeMode,
                    isExpanded: true,
                    onChanged: controller.updateThemeMode,
                    items: [
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text(
                            AppLocalizations.of(context)!.themeListItemSystem),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text(
                            AppLocalizations.of(context)!.themeListItemLight),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text(
                            AppLocalizations.of(context)!.themeListItemDark),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
