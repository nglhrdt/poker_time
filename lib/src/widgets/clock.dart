import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../poker_time/timer_service.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    final timerInfo = Provider.of<TimerService>(context);

    final remaingSeconds = timerInfo.remainingTime;
    final isRunning = timerInfo.isRunning;

    return Column(children: [
      Text(
        getTimerText(remaingSeconds),
        style: const TextStyle(fontSize: 96),
      ),
      ElevatedButton.icon(
        onPressed: () {
          isRunning ? timerInfo.stopTimer() : timerInfo.startTimer();
        },
        icon: Icon(isRunning ? Icons.pause : Icons.play_arrow),
        label: Text(isRunning
            ? AppLocalizations.of(context)!.pauseButton
            : AppLocalizations.of(context)!.startButton),
      ),
    ]);
  }
}

String getTimerText(int remainingSeconds) {
  final minutes = (remainingSeconds / 60).floor().toString().padLeft(2, '0');
  final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');

  return '$minutes:$seconds';
}
