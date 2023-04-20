import 'package:flutter/material.dart';

import '../../constantes.dart';
import 'pop_up_profil/btn_points.dart';
import 'pop_up_profil/btn_pseudo.dart';

class BtnProfil extends StatelessWidget {
  const BtnProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.center,
      height: 60,
      width: 60,
      child: ElevatedButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            //size: const Size(200, 200),
            backgroundColor: kBlueColor,
            title: Text(
              'Votre profil',
              style: boutonTaille,
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(image: AssetImage("assets/images/avatar.png")),
                    SizedBox(height: 20),
                    BtnPseudo(),
                    SizedBox(height: 15),
                    BtnPoints(),
                  ],
                ),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          //padding: const EdgeInsets.all(2),
          alignment: Alignment.center,
          backgroundColor: kBlueColor, // Couleur du fond du bouton (bleu)
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kBlueColor,
          ),
          child: IconButton(
            icon: const Icon(Icons.account_circle),
            alignment: Alignment.center,
            iconSize: 50,
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
