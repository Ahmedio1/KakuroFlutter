  import 'package:flutter/material.dart';
  import 'package:audioplayers/audioplayers.dart';

  //import 'constantes.dart';
  //import 'main.dart';

  class Volume extends StatelessWidget {
    //const Volume({Key? key}) : super(key: key);
    final player = AudioPlayer();

  Volume({super.key});
    @override
    Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Icon(Icons.volume_up,
                color: Theme.of(context).colorScheme.primary, size: 40)),
          const SizedBox(width: 1.0),
          Slider(
            value: 0.5,
            onChanged: (value) {
              if(value>0.5){
                player.play(AssetSource('wiisportstheme.mp3'));
              }
              else{
                player.stop();
              }
            },
            activeColor: Theme.of(context).colorScheme.secondary,
            inactiveColor: Theme.of(context).colorScheme.background,
          ),
        ],
      );
    }
  }
