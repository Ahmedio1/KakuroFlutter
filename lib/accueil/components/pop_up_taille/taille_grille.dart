import 'package:flutter/material.dart';
import 'package:kakuro/constantes.dart';

import 'btn_4.dart';
import 'btn_6.dart';
import 'btn_8.dart';

class ChoixTaille extends StatelessWidget {
  const ChoixTaille({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: kBlueColor,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Taille de grille", style: bullesBleuCielTexte),
                      const Btn4(),
                      const Btn6(),
                      const Btn8(),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
