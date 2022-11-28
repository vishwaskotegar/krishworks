import 'package:flutter/material.dart';
import 'package:krishworks/utils/colors.dart';
import 'package:krishworks/widgets/keyBoardNumber.dart';

import 'buildPinRow.dart';

class BuildNumPad extends StatelessWidget {
  const BuildNumPad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      color: Colors.grey.shade900,
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyBoardNumber(
                n: 1,
                onPressed: () {
                  pinIndexSetup("1");
                },
              ),
              KeyBoardNumber(
                  n: 2,
                  onPressed: () {
                    pinIndexSetup("2");
                  }),
              KeyBoardNumber(
                  n: 3,
                  onPressed: () {
                    pinIndexSetup("3");
                  }),
              KeyBoardNumber(
                  n: 4,
                  onPressed: () {
                    pinIndexSetup("4");
                  }),
              KeyBoardNumber(
                  n: 5,
                  onPressed: () {
                    pinIndexSetup("5");
                  }),
              KeyBoardNumber(
                  n: 6,
                  onPressed: () {
                    pinIndexSetup("6");
                  }),
              KeyBoardNumber(
                  n: 7,
                  onPressed: () {
                    pinIndexSetup("7");
                  }),
              KeyBoardNumber(
                  n: 8,
                  onPressed: () {
                    pinIndexSetup("8");
                  }),
              KeyBoardNumber(
                  n: 9,
                  onPressed: () {
                    pinIndexSetup("9");
                  }),
              KeyBoardNumber(
                  n: 0,
                  onPressed: () {
                    pinIndexSetup("0");
                  }),
            ],
          )
        ],
      ),
    );
  }
}