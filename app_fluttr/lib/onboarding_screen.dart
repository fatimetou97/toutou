import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Login_Page.dart';
import 'lang/intro_screens/intro_page_1.dart';
import 'lang/intro_screens/intro_page_2.dart';
import 'lang/intro_screens/intro_page_3.dart';
import 'lang/intro_screens/intro_page_4.dart';
import 'main.dart';

class OnBoadingScreen extends StatefulWidget {
  const OnBoadingScreen({Key? key}) : super(key: key);
  @override
  _OnBoadingScreenState createState() => _OnBoadingScreenState();
}

class _OnBoadingScreenState extends State<OnBoadingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  String? token;
  getToken() async {
    //
    print("tokenn $token");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = index == 3;
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      //hiye lemt3al9a skip ile done
                      _controller.jumpToPage(3);
                    },
                    child: const Text('SKIP')),
                SmoothPageIndicator(controller: _controller, count: 4),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          if (token == null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignInPage1();
                                },
                              ),
                            );
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          }
                        },
                        child: Text('Done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 40),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('NEXT'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
