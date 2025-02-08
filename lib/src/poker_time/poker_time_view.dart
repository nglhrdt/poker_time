import 'package:flutter/material.dart';
import 'package:poker_time/src/poker_time/adaptive_timer_view.dart';

import '../widgets/settings_button.dart';

class PokerTimeView extends StatelessWidget {
  const PokerTimeView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poker Time'),
        actions: [
          SettingsButton(),
        ],
      ),
      body: AdaptiveTimerView(),
    );
  }
}
