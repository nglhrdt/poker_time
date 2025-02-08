import 'package:flutter/material.dart';
import 'package:poker_time/src/poker_time/game_over.dart';
import 'package:provider/provider.dart';

import 'timer_info.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    final timerInfo = Provider.of<TimerInfo>(context);

    final remaingSeconds = timerInfo.remainingTime;
    final isRunning = timerInfo.isRunning;
    final isFinished = timerInfo.isFinished;

    if (isFinished) {
      return const GameOver();
    }

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
        label: Text(isRunning ? 'Pause' : 'Start'),
      ),
    ]);
  }
}

String getTimerText(int remainingSeconds) {
  final minutes = (remainingSeconds / 60).floor().toString().padLeft(2, '0');
  final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');

  return '$minutes:$seconds';
}
