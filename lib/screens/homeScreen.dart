import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishworks/utils/colors.dart';
import 'package:krishworks/widgets/buildPinRow.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/buildNumPad.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style =
        const TextStyle(fontWeight: FontWeight.normal, fontSize: 20);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueBackgroundColor,
          leading: InkWell(
            child: const Icon(
              Icons.settings_outlined,
              size: 34,
            ),
            onTap: () {
              showDialog(
                // barrierDismissible: true,
                context: context,
                builder: (_) => Scaffold(
                  backgroundColor: Colors.transparent,
                  bottomNavigationBar: BuildNumPad(),
                  body: AlertDialog(
                    content: BuildPinRow(),
                    title: Center(
                      child: Text(
                        "Developer Passcode",
                        style: GoogleFonts.poppins(textStyle: style)
                        .copyWith(fontSize: 22),
                      ),
                    ),
                    // actions: const [,],
                  ),
                ),
              );
            },
          ),
          centerTitle: true,
          title: Container(
            width: 400,
            height: 40,
            // color: blueColor,
            decoration: const BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
              child: TabBar(
                onTap: navigationTapped,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: whiteColor),
                tabs: [
                  Text(
                    "Home",
                    style: GoogleFonts.poppins(
                        color: _page == 0 ? blueColor : whiteColor,
                        textStyle: style),
                  ),
                  Text(
                    "About Us",
                    style: GoogleFonts.poppins(
                      color: _page == 1 ? blueColor : whiteColor,
                      textStyle: style,
                    ),
                  ),
                  Text(
                    "Updates",
                    style: GoogleFonts.poppins(
                      color: _page == 2 ? blueColor : whiteColor,
                      textStyle: style,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          onPageChanged: onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: const [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: "https://krishworks.com/",
            ),
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: "https://krishworks.com/about/",
            ),
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: "https://krishworks.com/updates/",
            ),
          ],
        ),
        // bottomNavigationBar: BuildNumPad() ,
      ),
    );
  }
}
