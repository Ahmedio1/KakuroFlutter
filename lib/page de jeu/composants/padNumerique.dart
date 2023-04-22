import 'package:flutter/material.dart';
import '../../constantes.dart';

class MyPad extends StatefulWidget {
  @override
  _MyPadState createState() => _MyPadState();
}

class _MyPadState extends State<MyPad> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 6,
        children: List.generate(12, (index) {
          return Container(
            width: 0.1 * largeurEcran(context),
            height: 0.1 * largeurEcran(context),
            decoration: BoxDecoration(
                color: themeSombre.colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: themeSombre.colorScheme.secondary, width: 2)),
            child: Center(
                child: TextButton(
              onPressed: () {
                print(index + 1);
              },
              child: Text(
                (index + 1).toString(),
                style: bullesSecondaireTexte(context),
              ),
            )),
          );
        }),
      ),
    );
  }
}
