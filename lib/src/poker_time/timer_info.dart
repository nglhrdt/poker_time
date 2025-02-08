import 'dart:async';

import 'package:flutter/material.dart';

import 'blind_values.dart';

class TimerInfo with ChangeNotifier {
  final _maxRounds = 9;
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

  int _remainingTime = 2;
  int _round = 0;
  bool _isRunning = false;
  bool _isFinished = false;
  Timer _timer = Timer(Duration.zero, () {});

  int get remainingTime => _remainingTime;
  int get round => _round;
  bool get isRunning => _isRunning;
  bool get isFinished => _isFinished;
  BlindValues get currentBlinds => _blinds[_round];
  BlindValues? get nextBlinds =>
      _round + 1 < _maxRounds ? _blinds[_round + 1] : null;

  void startTimer() {
    _isRunning = true;
    notifyListeners();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
      } else {
        if (_round == _maxRounds - 1) {
          _isFinished = true;
          _isRunning = false;
          timer.cancel();
          notifyListeners();
          return;
        }
        _round++;
        _remainingTime = 2;
      }
      notifyListeners();
    });
  }

  void stopTimer() {
    _timer.cancel();
    _isRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    _timer.cancel();
    _remainingTime = 2;
    _round = 0;
    _isRunning = false;
    _isFinished = false;
    notifyListeners();
  }
}
