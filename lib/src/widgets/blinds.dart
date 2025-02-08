import 'package:flutter/material.dart';
import 'package:poker_time/src/poker_time/timer_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Blinds extends StatelessWidget {
  const Blinds({super.key});

  @override
  Widget build(BuildContext context) {
    final timerInfo = Provider.of<TimerService>(context);
    final currentBlinds = timerInfo.currentBlinds;
    final nextBlinds = timerInfo.nextBlinds;

    return Column(
      children: [
        Text(
          currentBlinds.toString(),
          style: const TextStyle(fontSize: 48),
        ),
        Text(
          nextBlinds?.toString() ?? AppLocalizations.of(context)!.lastRound,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
