import 'package:flutter/material.dart';

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
    required int round,
  }) : _round = round;

  final int _round;

  String getText(blinds, round) {
    if (round >= 0 && round < blinds.length) {
      return blinds[round].toString();
    } else {
      return 'Game over';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getText(_blinds, _round),
          style: const TextStyle(fontSize: 48),
        ),
        Text(
          getText(_blinds, _round + 1),
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
