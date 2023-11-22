import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanagertwo/widgets/appbutton.dart';
import 'package:taskmanagertwo/widgets/background.dart';

import 'rsetpasword.dart';
class OtpVerifaction extends StatelessWidget {
  const OtpVerifaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PinCodeTextField(
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 40,
              fieldWidth: 35,
              activeFillColor: Colors.white,
            ),
            animationDuration: Duration(milliseconds: 300),
            backgroundColor: Colors.blue.shade50,
            enableActiveFill: true,
           
            onCompleted: (v) {
              print("Completed");
            },
            
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            }, appContext: context,
          ),
          SizedBox(height: 15,),
          AppButton(ontap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RestPassword()));
          }, text: Text("Verify")),
        
      ],)),
    );
  }
}
