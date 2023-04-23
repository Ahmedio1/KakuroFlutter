import 'package:flutter/material.dart';
import 'package:kakuro/constantes.dart';
import 'accueil/body.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  /*Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Page d'accueil",
      theme: themeClair,
      home: const MyHomePage(),
    );
  }*/
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

/*
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      //bottomNavigationBar: BottomBar(),
    );
  }
}*/
