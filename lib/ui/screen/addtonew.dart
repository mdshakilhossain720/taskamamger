import 'package:flutter/material.dart';
import 'package:taskmanagertwo/utils/textstyle.dart';
import 'package:taskmanagertwo/widgets/appbutton.dart';
import 'package:taskmanagertwo/widgets/background.dart';
import 'package:taskmanagertwo/widgets/text_formfieldresuable.dart';

import '../../widgets/userprofile.dart';
class AddToNew extends StatelessWidget {
  const AddToNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              userprofile(),
              Column(
                children: [
                  SizedBox(height: 50,),
                 Text("ADD TO NEW ",style: Bigtitletext(),),
                  SizedBox(height: 10,),
                  AppTextFormField(controller: TextEditingController(), hintext:'Subject'),
                  SizedBox(height: 10,),
                  AppTextFormField(
                      //maxline: 5,
                      controller: TextEditingController(), hintext: 'Described'),
                  SizedBox(height: 20,),
                  AppButton(ontap: (){}, text: Text("Save")),
          
          
          
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
