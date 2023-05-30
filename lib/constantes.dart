//Importation des packages :
import 'package:flutter/material.dart';

TextStyle bullesTexte(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return TextStyle(
    color: isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF3D5467),
    fontSize: 30,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );
}

TextStyle bullesSecondaireTexte(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return TextStyle(
    color: isDarkMode ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );
}

TextStyle bullesBleuCielTexte = const TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 18,
  fontWeight: FontWeight.w400, //épaisseur du texte : regular
  fontFamily: 'Inter',
);

TextStyle kakuroCase = const TextStyle(
  color: Color(0xFF000000),
  fontSize: 18,
  fontWeight: FontWeight.w400, //épaisseur du texte : regular
  fontFamily: 'Inter',
);

TextStyle kakuroDictateur = const TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 12,
  fontWeight: FontWeight.w400, //épaisseur du texte : regular
  fontFamily: 'Inter',
);

TextStyle kakuroPad(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return TextStyle(
    color: isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF3D5467),
    fontSize: 18,
    fontWeight: FontWeight.w500, //épaisseur du texte : Medium
    fontFamily: 'Inter',
  );
}

//Couleurs et styles pour le thème sombre :
ThemeData themeSombre = ThemeData(
  colorScheme: const ColorScheme(
      primary: Color(0xFF3D5467), //bleu foncé pour les bulles principales
      secondary: Color(0xFFA5CBE6), //bleu clair
      error: Color(0xFFF0C3C3), //rouge pour les erreurs
      tertiary: Color(0xFFD9D9D9), // gris clair pour cases bloquées

      surface: Color(
          0xFF436C7C), //bleu medium pour le triangle de droite dans le Kakuro
      background: Color(0xFFFFFFFF), //blanc pour les bulles secondaires

      onPrimary: Colors.white, //blanc pour les textes en terme sombre
      onSecondary:
          Color(0xFFA5CBE6), //bleu clair pour les boutons de navigation
      onBackground: Colors.white, //blanc pour les fonds de barre de navigation
      onError: Colors.black, //noir
      onSurface: Colors.black, //noir
      brightness: Brightness.dark),
);

//Couleurs et styles pour le thème clair :
// Couleurs et styles pour le thème clair
ThemeData themeClair = ThemeData(
  colorScheme: const ColorScheme(
      primary: Color(0xFFFFFFFF), // bleu foncé pour les bulles principales
      secondary: Color(0xFFA5CBE6), // bleu clair
      error: Color(0xFFF0C3C3), // rouge pour les erreurs
      tertiary: Color(0xFFD9D9D9), // gris clair pour cases bloquées

      surface: Color(
          0xFF436C7C), //bleu medium pour le triangle de droite dans le Kakuro
      background: Color(0xFF3D5467), // bleu foncé pour les bulles secondaires

      onPrimary: Color(0xFF3D5467), // On écrit en bleu foncé
      onSecondary:
          Color(0xFF3D5467), // bleu foncé pour les boutons de navigation
      onBackground:
          Color(0xFFD9D9D9), // gris clair pour les fonds de barre de navigation
      onError: Colors.black, // noir
      onSurface: Colors.black, // noir
      brightness: Brightness.light),
);

num largeurEcran(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

num hauteurEcran(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

//Fonction pas utilisée pour l'instant,mais utilisable si besoin de texte responsive
double responsiveFontSize(BuildContext context, double baseFontSize) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  // Taille de base pour la référence (Galaxy A52S: 1080 x 2400), mais screenWidth = 900 et screenHeight = 412 (je ne sais pas pourquoi)
  double referenceWidth = 900;
  double referenceHeight = 412;

  // Calculez la taille de police proportionnelle
  double responsiveSize = baseFontSize *
      (screenWidth / referenceWidth + screenHeight / referenceHeight) /
      2;

  return responsiveSize;
}
