import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'home.page.dart';

//c'est la page premier page qui s'affiche avant la page d'accueil
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/umbrellarain.json'),
      //Column(
      // children: [
      //  Image.asset('assets/nuages.png'),
      // const Text('WEATHER APP',
      // style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white,),)

      // ],
      // ),
      backgroundColor: Colors.blue.shade100,
      //nextscreen nous permet de passer a la page suivante
      nextScreen: const Home(),
      splashIconSize: 1000,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
