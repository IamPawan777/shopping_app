import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrapyad/pages/entry.dart';
import 'package:scrapyad/pages/signup.dart';
import 'package:scrapyad/widget/content_model.dart';
import 'package:scrapyad/widget/widget_support.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0, bottom: 20),
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            contents[i].image,
                            height: 350,
                            width: MediaQuery.of(context).size.width ,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Spacer(),
                     
                        Text(
                          contents[i].title,
                          style: AppWidget.headlineTextFieldStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          contents[i].description,
                          style: AppWidget.lightTextFieldStyle,
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => EntryPage()));
              }
              _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Center(
                child: Text(
                 currentIndex == contents.length - 1?"Start": "Next",
                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black38
      ),
    );
  }

}







// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:scrapyad/pages/home.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
   
//     return AnimatedSplashScreen(
//       splash: Center(
//         child: Lottie.asset('assets/images/anima.json'),
//       ), 
//       nextScreen: Home(),
//       splashIconSize: 300,
//       duration: 4500,
//       backgroundColor: Colors.white,
//     );
//   }
// }