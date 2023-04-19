import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'components/btn_jouer.dart';
import 'components/btn_regles.dart';
import 'components/title_accueil.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fond.png'),
              fit: BoxFit.cover,
            ),
          ),
          //constraints: const BoxConstraints.expand(),
        ),
        Center(
          child: Column(children: const [
            SizedBox(height: 40),
            TitleAccueil(),
            SizedBox(height: 135),
            BtnJouer(),
            SizedBox(height: 25),
            BtnRegles(),
          ]),
        ),
      ],
    );
  }
}
