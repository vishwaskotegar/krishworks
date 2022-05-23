import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishworks/widgets/keyBoardNumber.dart';

int pinIndex = 0;
List<String> currentPin = ['', '', '', ''];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextEditingController pinFiveController = TextEditingController();
  TextEditingController pinSixController = TextEditingController();

class BuildPinRow extends StatefulWidget {
  const BuildPinRow({Key? key}) : super(key: key);

  @override
  State<BuildPinRow> createState() => _BuildPinRowState();
}

class _BuildPinRowState extends State<BuildPinRow> {
  
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  

  @override
  void dispose() {
    pinOneController.dispose();
    pinTwoController.dispose();
    pinThreeController.dispose();
    pinFourController.dispose();
    pinFiveController.dispose();
    pinSixController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinOneController,
          ),
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinTwoController,
          ),
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinThreeController,
          ),
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinFourController,
          ),
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinFiveController,
          ),
          PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinSixController,
          ),
        ],
      ),
    );
  }
}

class BuildNumPad extends StatelessWidget {
  const BuildNumPad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
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
        ),
      ),
    );
  }
}

pinIndexSetup(String text) {
  if (pinIndex == 0) {
    pinIndex = 1;
  } else if (pinIndex < 6) {
    pinIndex++;
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    String strPin = "";
    currentPin.forEach((element) {
      strPin += element;
    });
    if (pinIndex == 4) {
      print(strPin);
    }
  }
}

setPin(int index, String text) {
  switch (index) {
    case 1:
      pinOneController.text = text;
      break;
    case 2:
      pinTwoController.text = text;
      break;
    case 3:
      pinThreeController.text = text;
      break;
    case 4:
      pinFourController.text = text;
      break;
    case 5:
      pinFiveController.text = text;
      break;
    case 6:
      pinSixController.text = text;
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
