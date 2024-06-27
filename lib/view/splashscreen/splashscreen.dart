import 'package:flutter/material.dart';
import 'package:musicplayer/view/homescreen/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Image.asset(
          "assets/images/play-button_109720.png",
          scale: 3.0,
        ),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Text("Music Player")),
    );
  }
}
