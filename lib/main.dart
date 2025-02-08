import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/poker_time/timer_service.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(
    ChangeNotifierProvider(
      create: (context) => TimerService(),
      child: MyApp(settingsController: settingsController),
    ),
  );
}
