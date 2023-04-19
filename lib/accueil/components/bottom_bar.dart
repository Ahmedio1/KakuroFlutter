import 'package:flutter/material.dart';

import '../../constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xff424242).withOpacity(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            iconSize: 50,
            color: kBlueColor,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.align_vertical_bottom_sharp),
            iconSize: 50,
            color: kBlueColor,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            iconSize: 50,
            color: kBlueColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
