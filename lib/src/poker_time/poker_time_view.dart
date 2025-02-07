import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/settings_button.dart';
import 'blinds.dart';
import 'timer_info.dart';
import 'timer_text.dart';

class PokerTimeView extends StatelessWidget {
  const PokerTimeView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final timerInfo = Provider.of<TimerInfo>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Poker Time'),
        actions: [
          SettingsButton(),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (timerInfo.isGameOver) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Game Over',
                    style: TextStyle(fontSize: 48),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      timerInfo.resetTimer();
                    },
                    icon: const Icon(Icons.replay),
                    label: const Text('Play again'),
                  ),
                ],
              ),
            );
          }
          return orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: TimerText(),
                    ),
                    Center(
                      child: Blinds(),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: TimerText(),
                    ),
                    Center(
                      child: Blinds(),
                    )
                  ],
                );
        },
      ),
    );
  }
}
