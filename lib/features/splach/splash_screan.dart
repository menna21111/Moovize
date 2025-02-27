import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../home/presinatiion/views/widgets/bottomnavbar.dart';

class Splachscreanview extends StatelessWidget {
  const Splachscreanview({super.key, required this.isdark});
  final bool isdark;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      splash: Lottie.asset('assets/lottie/mooviz.json'),
      nextScreen:  Bottomnavbar(isdark: isdark,),
      splashIconSize: 400,
      duration: 2000,
    );
  }
}
