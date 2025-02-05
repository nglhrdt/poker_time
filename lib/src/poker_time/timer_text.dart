import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'timer_info.dart';

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final timerInfo = Provider.of<TimerInfo>(context);

    final remaingSeconds = timerInfo.remainingTime;
    final isRunning = timerInfo.isRunning;

    return Column(children: [
      Text(
        '${(remaingSeconds / 60).floor().toString().padLeft(2, '0')}:${(remaingSeconds % 60).toString().padLeft(2, '0')}',
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
