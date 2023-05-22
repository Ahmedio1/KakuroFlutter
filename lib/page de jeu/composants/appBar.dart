import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kakuro/accueil/components/btn_settings.dart';
import '../../constantes.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(bool) updateTheme;
  final AudioPlayer player;
  final bool isNightMode;
  final double initialVolume;
  final void Function(double) updateVolume;
  

  const MyAppBar(
      {Key? key,
      required this.updateTheme,
      required this.player,
      required this.isNightMode,
      required this.initialVolume,
      required this.updateVolume})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTimer timer = MyTimer();
    return AppBar(
        automaticallyImplyLeading: false,
        //elevation: 10, // ombre
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              Expanded(
            child: Center(child: IconButton(
                icon: const Icon(Icons.home),
                color: Theme.of(context).colorScheme.onPrimary,
                iconSize: 40,
                onPressed: () {
                  //On retourne à la page d'accueil
                  Navigator.pop(context);
                },
              ),),
          ),
          //BtnProfil(),
              Expanded(
                child: Center(child: timer),
              ),
              Expanded(
               child: Center(
                  child: Parametres(
                   updateTheme: updateTheme,
                    player: player,
                   isNightMode: isNightMode,
                   initialVolume: initialVolume,
                    updateVolume: (volume) {
                      updateVolume(volume);
                    },
                   buttonSize: 40,
                    hasRoundedContainer: false
                  ),
               ),
              ),
        ]));
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
        style: bullesTexte(context),
      ),
    );
  }
}
