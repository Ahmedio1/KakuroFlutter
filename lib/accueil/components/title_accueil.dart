import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as gf;

import '../../constantes.dart';

class TitleAccueil extends StatelessWidget {
  const TitleAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "Kakuro",
        style: gf.GoogleFonts.karma(fontSize: 50, fontWeight: FontWeight.bold, color: themeSombre.colorScheme.primary),
      ),
      Text(
        'Master',
        style: gf.GoogleFonts.karma(fontSize: 50, fontWeight: FontWeight.bold, color: const Color.fromRGBO(25, 151, 23, 1)
        ),
      ),
    ]);
  }
}
