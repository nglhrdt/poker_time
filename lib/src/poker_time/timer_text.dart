import 'package:flutter/material.dart';

class TimerText extends StatelessWidget {
  const TimerText({
    super.key,
    required int remainingSeconds,
    required bool isRunning,
    required this.onPressed,
  })  : _remaingSeconds = remainingSeconds,
        _isRunning = isRunning;

  final int _remaingSeconds;
  final bool _isRunning;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        '${(_remaingSeconds / 60).floor().toString().padLeft(2, '0')}:${(_remaingSeconds % 60).toString().padLeft(2, '0')}',
        style: const TextStyle(fontSize: 48),
      ),
      ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
        label: Text(_isRunning ? 'Pause' : 'Start'),
      ),
    ]);
  }
}
