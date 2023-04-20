import 'package:flutter/material.dart';
import 'package:kakuro/accueil/components/bottom_bar.dart';
import 'components/btn_jouer.dart';
import 'components/btn_regles.dart';
import 'components/title_accueil.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            SizedBox(height: 120),
            BtnJouer(),
            SizedBox(height: 25),
            BtnRegles(),
          ]),
        ),
        const BottomBar(),
      ],
    );
  }
}
