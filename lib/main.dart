import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'constantes.dart';
import 'parametres.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData currentTheme = themeSombre;
  final AudioPlayer player = AudioPlayer();
  bool isNightMode = true;
  double volume = 0.5;

  void updateTheme(bool isNightMode) {
    setState(() {
      currentTheme = isNightMode ? themeSombre : themeClair;
      this.isNightMode = isNightMode;
    });
  }

  @override
  void initState() {
    super.initState();
    //_prepareAudio();
    player.play(AssetSource('wiisportstheme.mp3'));
    player.setReleaseMode(ReleaseMode.loop);
  }

  /*Future<void> _prepareAudio() async {
    await player.setSource(AssetSource('wiisportstheme.mp3'));
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: currentTheme,
      home: Body(
          updateTheme: updateTheme,
          player: player,
          isNightMode: isNightMode,
          initialVolume: volume,
          updateVolume: (double volume) =>
              setState(() => this.volume = volume)),
    );
  } //Update volume est un callback qui permet de mettre à jour le volume
}

class Body extends StatelessWidget {
  final void Function(bool) updateTheme;
  final AudioPlayer player;
  final bool isNightMode;
  final double initialVolume;
  final void Function(double) updateVolume;

  const Body(
      {Key? key,
      required this.updateTheme,
      required this.player,
      required this.isNightMode,
      required this.initialVolume,
      required this.updateVolume})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fond.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 200),
                Parametres(
                    updateTheme: updateTheme,
                    player: player,
                    isNightMode: isNightMode,
                    initialVolume: initialVolume,
                    updateVolume: updateVolume),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
