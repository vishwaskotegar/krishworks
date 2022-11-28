import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:krishworks/utils/colors.dart';

class KeyBoardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  const KeyBoardNumber({Key? key, required this.n, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 40,
      decoration: BoxDecoration(
        // shape: BoxShape.rectangle,
        color: Colors.transparent,
      ),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24* MediaQuery.of(context).textScaleFactor,color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
