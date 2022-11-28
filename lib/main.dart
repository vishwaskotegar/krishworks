import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishworks/screens/homeScreen.dart';
import 'package:krishworks/screens/nextPage.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: DefaultTabController(
    //     length: 1,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: ,
    //         title: TabBar(
    //           indicator: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10)),
    //           tabs: [Text("Home",style: GoogleFonts.poppins(textStyle: TextStyle(color: blue),fontSize: 20,))],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
