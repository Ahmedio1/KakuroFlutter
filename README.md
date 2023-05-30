# kakuro

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# AUTHENTIFICATION 

# Comment générer une empreinte SHA-1 et SHA-256 pour Firebase dans un projet Flutter

Il est souvent nécessaire de fournir à Firebase une empreinte SHA-1 et SHA-256 pour configurer certaines fonctionnalités, comme l'authentification Google Sign-In. Voici comment vous pouvez les générer pour votre projet Flutter.

## Prérequis

- Assurez-vous que vous avez installé le [JDK (Java Development Kit)](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) sur votre machine.

## Étapes pour générer SHA-1 et SHA-256

1. Ouvrez votre terminal ou invite de commandes.

2. Naviguez vers le dossier `android` de votre projet Flutter en utilisant la commande `cd`. Par exemple :

    ```bash
    cd chemin_vers_votre_projet/android
    ```

3. Exécutez la commande suivante pour générer les empreintes SHA-1 et SHA-256 :

    ```bash
    ./gradlew signingReport
    ```

    Si vous utilisez Windows, vous devrez utiliser `gradlew` au lieu de `./gradlew` :

    ```bash
    gradlew signingReport
    ```

4. Recherchez dans la sortie de la commande les lignes contenant `SHA1:` et `SHA256:`. Ce sont vos empreintes SHA-1 et SHA-256 respectivement. Elles ressembleront à quelque chose comme ça :

    ```
    SHA1: D8:3D:53:49:5D:5C:86:12:66:2B:2C:DF:5C:41:EF:43:67:71:9B:6A
    SHA256: 13:8D:6A:DB:F0:9B:20:3E:C3:0B:A5:66:01:5D:8C:7E:30:88:F0:F1:CF:68:8E:4C:10:EA:B3:BE:7B:40:9B:7A
    ```

5. Copiez et collez ces empreintes dans les paramètres de votre projet Firebase.

6. Vous cliquez sur l'engrenage à gauche.
    * paramètre du projet

7. Dans karakuro_flutter vous collez vos clé SHA

8. Vous telecharger votre nouveau fichier google-services.json

9. Dans votre projet remplacez le, il se trouve 
```bash
/android/app
```
Et voilà! Vous avez généré et ajouté vos empreintes SHA à votre projet Firebase.

## oe c'est greg
