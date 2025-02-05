import 'package:flutter/material.dart';
import 'package:poker_time/src/poker_time/timer_info.dart';
import 'package:provider/provider.dart';

import 'blind_values.dart';

class Blinds extends StatelessWidget {
  final _blinds = [
    BlindValues(small: 5, big: 10),
    BlindValues(small: 10, big: 20),
    BlindValues(small: 25, big: 50),
    BlindValues(small: 50, big: 100),
    BlindValues(small: 100, big: 200),
    BlindValues(small: 200, big: 400),
    BlindValues(small: 400, big: 800),
    BlindValues(small: 800, big: 1600),
    BlindValues(small: 1600, big: 3200),
  ];

  Blinds({
    super.key,
  });

  String getText(blinds, round) {
    if (round >= 0 && round < blinds.length) {
      return blinds[round].toString();
    } else {
      return 'Game over';
    }
  }

  @override
  Widget build(BuildContext context) {
    final timerInfo = Provider.of<TimerInfo>(context);

    return Column(
      children: [
        Text(
          getText(_blinds, timerInfo.round),
          style: const TextStyle(fontSize: 48),
        ),
        Text(
          getText(_blinds, timerInfo.round + 1),
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
