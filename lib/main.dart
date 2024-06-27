import 'package:flutter/material.dart';
import 'package:musicplayer/controller/homescreencontroller.dart';
import 'package:musicplayer/controller/playercontroller.dart';
import 'package:musicplayer/view/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AudioPlayerController(),
        ),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
