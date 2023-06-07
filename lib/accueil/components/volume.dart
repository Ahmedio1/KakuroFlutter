import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Volume extends StatefulWidget {
  final AudioPlayer player;
  final double initialVolume;
  final void Function(double) updateVolume;

  const Volume(
      {Key? key,
      required this.player,
      required this.initialVolume,
      required this.updateVolume})
      : super(key: key);

  @override
  _VolumeState createState() =>
      _VolumeState(player: player, initialVolume: initialVolume);
}

class _VolumeState extends State<Volume> {
  double _currentVolume;
  final AudioPlayer player;

  _VolumeState({required this.player, required double initialVolume})
      : _currentVolume = initialVolume;

  @override
  void initState() {
    super.initState();
    _currentVolume = widget.initialVolume;
  }

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
          value: _currentVolume,
          onChanged: (value) {
            setState(() {
              _currentVolume = value; //Mise à jour de l'état local du volume
            });
            widget.player
                .setVolume(_currentVolume); //Mise à jour du volume de l'audio
            widget.updateVolume(
                value); ////Update volume est un callback qui permet de mettre à jour l'état global du volume
          },
          activeColor: Theme.of(context).colorScheme.onSecondary,
          inactiveColor: Theme.of(context).colorScheme.onBackground,
        ),
      ],
    );
  }
}
