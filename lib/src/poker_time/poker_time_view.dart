import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/settings_button.dart';
import 'blinds.dart';
import 'timer_text.dart';

class PokerTimeView extends StatefulWidget {
  const PokerTimeView({super.key});

  static const routeName = '/';

  @override
  State<PokerTimeView> createState() => _PokerTimeViewState();
}

class _PokerTimeViewState extends State<PokerTimeView> {
  static const roundDuration = 480;

  var _round = 0;
  var _timerCount = roundDuration;
  var _isRunning = false;
  var _isGameOver = false;
  late Timer _timer;

  final _maxRounds = 9;

  toggleTimer() {
    if (_isRunning) {
      _timer.cancel();
      setState(() {
        _isRunning = false;
      });
    } else {
      setState(() {
        _isRunning = true;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_timerCount > 0) {
            _timerCount--;
          } else {
            _isRunning = false;
            if (_round < _maxRounds - 1) {
              _round++;
              _timerCount = roundDuration;
            } else {
              _isGameOver = true;
              _timer.cancel();
            }
          }
        });
      });
    }
  }

  resetGame() {
    _timer.cancel();
    setState(() {
      _round = 0;
      _timerCount = roundDuration;
      _isRunning = false;
      _isGameOver = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poker Time'),
        actions: [
          SettingsButton(),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (_isGameOver) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Game Over',
                    style: TextStyle(fontSize: 48),
                  ),
                  ElevatedButton.icon(
                    onPressed: resetGame,
                    icon: const Icon(Icons.replay),
                    label: const Text('Play again'),
                  ),
                ],
              ),
            );
          }
          return orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: TimerText(
                        remainingSeconds: _timerCount,
                        isRunning: _isRunning,
                        onPressed: toggleTimer,
                      ),
                    ),
                    Center(
                      child: Blinds(round: _round),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: TimerText(
                        remainingSeconds: _timerCount,
                        isRunning: _isRunning,
                        onPressed: toggleTimer,
                      ),
                    ),
                    Center(
                      child: Blinds(round: _round),
                    )
                  ],
                );
        },
      ),
    );
  }
}
