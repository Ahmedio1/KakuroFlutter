import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constantes.dart';

class TitleAccueil extends StatelessWidget {
  const TitleAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "Kakuro",
        style: GoogleFonts.getFont('Karma').copyWith(
            fontSize: 50, fontWeight: FontWeight.bold, color: kBlueColor),
      ),
      Text(
        'Master',
        style: GoogleFonts.getFont('Karma').copyWith(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: kGreenColor,
        ),
      ),
    ]);
  }
}
