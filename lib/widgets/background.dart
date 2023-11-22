import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class BackGround extends StatelessWidget {
  final Widget child;
  const BackGround({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    final Size screensize=MediaQuery.of(context).size;
    return  Stack(
      children: [
        SvgPicture.asset("assets/images/background.svg",height: screensize.height,
          width: screensize.width,fit: BoxFit.cover,),
       child
      ],
    );
  }
}
