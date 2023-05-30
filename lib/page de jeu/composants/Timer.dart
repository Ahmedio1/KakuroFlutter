import 'dart:async';

import 'package:flutter/material.dart';

import '../../constantes.dart';

class MyTimer extends StatefulWidget {
  final void Function(int) timerValueCallback;

  const MyTimer({required this.timerValueCallback});
  @override
  _MyTimerState createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  int _seconds = 0;
  Timer? _timer;

  void initState() {
    super.initState();
    startTimer();
  }

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
          widget.timerValueCallback(_seconds);
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

  int getTimer() {
    return _seconds;
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
        style: bullesTexte(context),
      ),
    );
  }
}
