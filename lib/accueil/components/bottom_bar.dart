import 'package:flutter/material.dart';
import 'package:kakuro/accueil/components/btn_profil.dart';

import 'btn_classement.dart';
import 'btn_settings.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          BtnProfil(),
          BtnClassement(),
          BtnSettings(),
        ],
      ),
    );
  }
}
