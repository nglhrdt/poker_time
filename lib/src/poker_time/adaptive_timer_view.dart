import 'package:flutter/material.dart';
import 'package:poker_time/src/poker_time/blinds.dart';
import 'package:poker_time/src/poker_time/timer.dart';
import 'package:provider/provider.dart';

import 'game_over.dart';
import 'timer_info.dart';

class AdaptiveTimerView extends StatelessWidget {
  const AdaptiveTimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      final timerInfo = Provider.of<TimerInfo>(context);
      final isFinished = timerInfo.isFinished;
      final isMoreTallThanWide = constraints.maxHeight > constraints.maxWidth;

      if (isFinished) {
        return const GameOver();
      }

      final children = [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Timer()],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Blinds()],
          ),
        ),
      ];

      return isMoreTallThanWide
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            )
          : Row(
              children: children,
            );
    });
  }
}
