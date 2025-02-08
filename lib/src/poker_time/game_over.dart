import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'timer_info.dart';

class GameOver extends StatelessWidget {
  const GameOver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerInfo = Provider.of<TimerInfo>(context);

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
}
