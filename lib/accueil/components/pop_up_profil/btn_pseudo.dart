import 'package:flutter/material.dart';

import '../../../constantes.dart';

class BtnPseudo extends StatelessWidget {
  const BtnPseudo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Pseudo : ', style: boutonTaille),
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(165, 203, 230, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '',
            style: boutonTaille,
          ),
        ),
      ],
    );
  }
}
