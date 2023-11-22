import 'package:flutter/material.dart';
import 'package:taskmanagertwo/utils/textstyle.dart';
import 'package:taskmanagertwo/widgets/appbutton.dart';
import 'package:taskmanagertwo/widgets/background.dart';
import 'package:taskmanagertwo/widgets/text_formfieldresuable.dart';

import 'otpverifacrion.dart';
class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Your Email Address",style: Bigtitletext(),),
          Text("6 digit your email address passord",style: smalltext()),
          SizedBox(height: 50,),
          AppTextFormField(controller: TextEditingController(), hintext: 'Email'),

          AppButton(ontap: (){
            Navigator.push(context, MaterialPageRoute(builder: (contex)=>OtpVerifaction()));
          }, text: Text("Verify")),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" have account?"),
              TextButton(onPressed: (){


              }, child: Text("Login",style: TextStyle(color: Colors.green),)),

            ],
          )

        ],

      )),
    );
  }
}
