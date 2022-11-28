// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:krishworks/widgets/keyBoardNumber.dart';

import '../screens/nextPage.dart';

int pinIndex = 0;
bool isPinValid = false;
List<String>? currentPin;
TextEditingController? pinOneController;
TextEditingController? pinTwoController;
TextEditingController? pinThreeController;
TextEditingController? pinFourController;
TextEditingController? pinFiveController;
TextEditingController? pinSixController;
BuildContext? widgetContext;

class BuildPinRow extends StatefulWidget {
  const BuildPinRow({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildPinRow> createState() => _BuildPinRowState();
}

class _BuildPinRowState extends State<BuildPinRow> {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPin = ['', '', '', '', '', ''];
    pinOneController = TextEditingController();
    pinTwoController = TextEditingController();
    pinThreeController = TextEditingController();
    pinFourController = TextEditingController();
    pinFiveController = TextEditingController();
    pinSixController = TextEditingController();
  }

  @override
  void dispose() {
    pinIndex = 0;
    pinOneController!.dispose();
    pinTwoController!.dispose();
    pinThreeController!.dispose();
    pinFourController!.dispose();
    pinFiveController!.dispose();
    pinSixController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widgetContext = context;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinOneController!,
          ),
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinTwoController!,
          ),
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinThreeController!,
          ),
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinFourController!,
          ),
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinFiveController!,
          ),
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinSixController!,
          ),
        ],
      ),
    );
  }
}

pinIndexSetup(String text) {
  // if (pinIndex == 0) {
  //   pinIndex = 1;
  // } else
  if (pinIndex < 6) {
    pinIndex++;
    setPin(pinIndex, text);
    currentPin![pinIndex - 1] = text;
    String strPin = "";
    currentPin!.forEach((element) {
      strPin += element;
    });
    if (pinIndex == 6) {
      verifyPass(strPin);
    }
  }
}

verifyPass(String strPin) {
  DateTime datetime = DateTime.now();
  int date = int.parse(DateFormat("d").format(datetime));
  int month = int.parse(DateFormat("M").format(datetime));
  int year = int.parse(DateFormat("y").format(datetime));
  int pass = date * month * year;
  // int pass = 23456;
  String passCode = "$pass";

  for (int i = 0; i < 6; i++) {
    passCode = "0$passCode";
  }

  print(pass);
  if (pass == int.parse(strPin)) {
    Navigator.of(widgetContext!).pop();
    Navigator.of(widgetContext!).push(
      MaterialPageRoute(
        builder: (widgetcontext) => NextPage(),
      ),
    );
  }
}

setPin(int index, String text) {
  switch (index) {
    case 1:
      pinOneController!.text = text;
      break;
    case 2:
      pinTwoController!.text = text;
      break;
    case 3:
      pinThreeController!.text = text;
      break;
    case 4:
      pinFourController!.text = text;
      break;
    case 5:
      pinFiveController!.text = text;
      break;
    case 6:
      pinSixController!.text = text;
      break;
  }
}

class PinNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;

  const PinNumber(
      {Key? key,
      required this.textEditingController,
      required this.outlineInputBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 45.0,
        child: TextField(
          enabled: false,
          keyboardType: TextInputType.number,
          controller: textEditingController,
          // enabled: false,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.0),
            border: outlineInputBorder,
          ),
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
