import 'package:flutter/material.dart';
import 'package:poker_time/src/poker_time/timer_info.dart';
import 'package:provider/provider.dart';

class Blinds extends StatelessWidget {
  const Blinds({super.key});

  @override
  Widget build(BuildContext context) {
    final timerInfo = Provider.of<TimerInfo>(context);
    final currentBlinds = timerInfo.currentBlinds;
    final nextBlinds = timerInfo.nextBlinds;

    return Column(
      children: [
        Text(
          currentBlinds.toString(),
          style: const TextStyle(fontSize: 48),
        ),
        Text(
          nextBlinds?.toString() ?? 'No more rounds',
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
