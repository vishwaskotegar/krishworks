import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishworks/utils/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  onNavigationTapped(int page) {
    setState(() {
      _page = page;
    });
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueBackgroundColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                  child: Container(
                    child: Text(
                      "Close ",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontWeight: FontWeight.w300)),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Settings",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontWeight: FontWeight.normal))),
              )
            ],
          )),
      body: Row(children: [
        Flexible(
          flex: 1,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  onNavigationTapped(0);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: _page == 0 ? whiteColor : blueBackgroundColor,
                  child: Center(
                    child: Text(
                      "Gallery",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20,
                            color:
                                _page == 0 ? blueBackgroundColor : yellowColor),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  onNavigationTapped(1);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: _page == 1 ? whiteColor : blueBackgroundColor,
                  child: Center(
                    child: Text(
                      "Contact Us",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20,
                            color:
                                _page == 1 ? blueBackgroundColor : yellowColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 5,
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                  child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: "https://krishworks.com/gallery/",
              )),
              Container(
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: "https://krishworks.com/contact/",
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
}
