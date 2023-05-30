import 'package:flutter/material.dart';
import 'package:kakuro/BD/gridbd.dart';
import 'package:kakuro/constantes.dart';
import 'accueil/body.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  ThemeData currentTheme = themeSombre;
  final AudioPlayer player = AudioPlayer();
  bool isNightMode = true;
  double volume = 0.1;

  void updateTheme(bool isNightMode) {
    setState(() {
      currentTheme = isNightMode ? themeSombre : themeClair;
      this.isNightMode = isNightMode;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    player.setVolume(volume);
    player.play(AssetSource('wiisportstheme.mp3'));
    player.setReleaseMode(ReleaseMode.loop);

    // Add lifecycle observer and pass the player
    WidgetsBinding.instance.addObserver(_Handler(player: player));
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      player.resume();
    } else if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      player.pause();
    }
  }

  /*Future<void> _prepareAudio() async {
    await player.setSource(AssetSource('wiisportstheme.mp3'));
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

class _Handler extends WidgetsBindingObserver {
  final AudioPlayer player;

  _Handler({required this.player});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      player
          .resume(); // Audio player is a custom class with resume and pause static methods
    } else {
      player.pause();
    }
  }
}


/*
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      //bottomNavigationBar: BottomBar(),
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
}*/
