import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class KeyBoardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  const KeyBoardNumber({Key? key, required this.n, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.transparent,
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        height: 90.0,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24* MediaQuery.of(context).textScaleFactor,color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
