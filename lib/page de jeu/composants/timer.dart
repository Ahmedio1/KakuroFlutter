import 'dart:async';
import 'package:flutter/material.dart';

class MyTimerApp extends StatefulWidget {
  @override
  _MyTimerAppState createState() => _MyTimerAppState();
}

class _MyTimerAppState extends State<MyTimerApp> {
  int _seconds = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          _seconds++;
        },
      ),
    );
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void resetTimer() {
    setState(() {
      _seconds = 0;
    });
  }

  String get timerText {
    Duration duration = Duration(seconds: _seconds);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        timerText,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
