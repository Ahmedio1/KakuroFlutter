import 'package:flutter/material.dart';

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
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(61, 84, 103, 1),
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
                    children: const [
                      Text("Taille de grille",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Inter',
                              color: Colors.white)),
                      Btn4(),
                      Btn6(),
                      Btn8(),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
