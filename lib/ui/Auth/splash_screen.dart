import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskmanagertwo/data/uitils.dart';
import 'package:taskmanagertwo/ui/Auth/login_screen.dart';
import 'package:taskmanagertwo/ui/screen/bottomnavbar.dart';
import 'package:taskmanagertwo/widgets/background.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    Future.delayed(Duration(seconds: 3)).then((value) => cheekuserlogin());
    super.initState();


  }

  Future<void> cheekuserlogin() async {
    final bool result = await AuthUitils().cheeklogingstate();
    if(result){
      AuthUitils().AuthgetData();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomNavBar()),
              (route) => false);
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()),
              (route) => false);
    }

  }

  @override
  Widget build(BuildContext context) {
    final Size screensize=MediaQuery.of(context).size;
    return Scaffold(

     body: BackGround(child:
     Center(child: SvgPicture.asset("assets/images/logo.svg",width: 200,fit: BoxFit.scaleDown,)),)

    );
  }
}
