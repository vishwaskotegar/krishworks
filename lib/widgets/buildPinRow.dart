import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildPinRow extends StatefulWidget {
  const BuildPinRow({Key? key}) : super(key: key);

  @override
  State<BuildPinRow> createState() => _BuildPinRowState();
}

class _BuildPinRowState extends State<BuildPinRow> {
  List<String> currentPin = ['', '', '', ''];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextEditingController pinFiveController = TextEditingController();
  TextEditingController pinSixController = TextEditingController();
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  int pinIndex = 0;

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
