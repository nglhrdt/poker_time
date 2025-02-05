import 'dart:async';

import 'package:flutter/material.dart';

class TimerInfo with ChangeNotifier {
  final int _maxRounds = 9;

  int _remainingTime = 480;
  int _round = 0;
  bool _isRunning = false;
  bool _isGameOver = false;
  Timer _timer = Timer(Duration.zero, () {});

  int get remainingTime => _remainingTime;
  int get round => _round;
  bool get isRunning => _isRunning;
  bool get isGameOver => _isGameOver;

  void startTimer() {
    _isRunning = true;
    notifyListeners();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
      } else {
        if (_round == _maxRounds - 1) {
          _isGameOver = true;
          _isRunning = false;
          timer.cancel();
          notifyListeners();
          return;
        }
        _round++;
        _remainingTime = 480;
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
    _remainingTime = 480;
    _round = 0;
    _isRunning = false;
    _isGameOver = false;
    notifyListeners();
  }
}
