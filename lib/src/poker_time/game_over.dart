import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          Text(
            AppLocalizations.of(context)!.gameOver,
            style: TextStyle(fontSize: 48),
          ),
          ElevatedButton.icon(
            onPressed: () {
              timerInfo.resetTimer();
            },
            icon: const Icon(Icons.replay),
            label: Text(AppLocalizations.of(context)!.restartButton),
          ),
        ],
      ),
    );
  }
}
