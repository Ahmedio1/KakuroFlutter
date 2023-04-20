import 'package:flutter/material.dart';
import 'package:kakuro/accueil/components/btn_profil.dart';

import '../../constantes.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        //canvasColor: Color(0xff424242).withOpacity(0.5),
        primaryColor: Colors.transparent,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const BtnProfil(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kBlueColor,
              ),
              child: IconButton(
                icon: const Icon(Icons.align_vertical_bottom_sharp),
                iconSize: 50,
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kBlueColor,
              ),
              child: IconButton(
                icon: const Icon(Icons.settings),
                iconSize: 50,
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
