import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskmanagertwo/widgets/background.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screensize=MediaQuery.of(context).size;
    return Scaffold(

     body: BackGround(child:
     Center(child: SvgPicture.asset("assets/images/logo.svg",width: 200,fit: BoxFit.scaleDown,)),)

    );
  }
}
