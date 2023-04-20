import 'dart:async';
import 'package:flutter/material.dart';
import '../../constantes.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTimer timer = MyTimer();
    return AppBar(
      elevation: 20,
      backgroundColor: themeSombre.colorScheme.primary,
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        SizedBox(width: 0.3 * largeurEcran(context)),
        timer,
        SizedBox(width: 0.3 * largeurEcran(context)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyTimer extends StatefulWidget {
  @override
  _MyTimerState createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
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
