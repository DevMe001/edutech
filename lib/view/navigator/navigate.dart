import 'package:elerningapp/view/components/flexible.dart';
// import 'package:elerningapp/view/homescreen/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {

 final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  bool _initialNavigationCompleted = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialNavigationCompleted) {
      Future.delayed(const Duration(seconds: 10), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const FlexibleLayout()),
        );
        _initialNavigationCompleted = true;
      });
    }
  }


   @override
  Widget build(BuildContext context) {
    {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 1, 52, 54), // Set the background color here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/EDU.png', width: 350, height: 350),
            SizedBox(
              width: 350, // Adjust the width as needed
              height: 100, // Adjust the height as needed
              child: LottieBuilder.asset(
                'assets/images/loader.json',
              ),
            ),
          ],
        ),
      );
    }
  }
}