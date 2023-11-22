import 'package:flutter/material.dart';
import 'package:taskmanagertwo/utils/textstyle.dart';
import 'package:taskmanagertwo/widgets/appbutton.dart';
import 'package:taskmanagertwo/widgets/background.dart';
import 'package:taskmanagertwo/widgets/text_formfieldresuable.dart';
class RestPassword extends StatelessWidget {
  const RestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("RESET PASSWORD ",style: Bigtitletext(),),
          SizedBox(height: 50,),
          AppTextFormField(controller: TextEditingController(), hintext:'Email'),
          SizedBox(height: 8,),
          AppTextFormField(controller: TextEditingController(), hintext: 'Password'),
          SizedBox(height: 15,),
          AppButton(ontap: (){}, text: Text('Reset')),


        ],
      )),
    );
  }
}
