import 'package:flutter/material.dart';

import '../../utils/textstyle.dart';
import '../../widgets/appbutton.dart';
import '../../widgets/background.dart';
import '../../widgets/text_formfieldresuable.dart';
import '../../widgets/userprofile.dart';
class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              userprofile(),
              BackGround(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Text("Update Profile ",style: Bigtitletext(),),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft:  Radius.circular(10),

                          ),
                        ),
                        child: Text("photo"),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight:  Radius.circular(10),
                            ),
                          ),
                         //child: Text("photo"),
                        ),
                      )
                    ],
                  ),
                  AppTextFormField(controller: TextEditingController(), hintext:'email'),
                  SizedBox(height: 10,),
                  AppTextFormField(
                      controller: TextEditingController(), hintext: 'FirstName'),
                     SizedBox(height: 10,),
                  AppTextFormField(controller: TextEditingController(), hintext:'LastName'),
                  SizedBox(height: 10,),
                  AppTextFormField(controller: TextEditingController(), hintext:'Phone Number'),
                  SizedBox(height: 10,),
                  AppTextFormField(controller: TextEditingController(), hintext:'Password'),
                  SizedBox(height: 20,),
                  AppButton(ontap: (){}, text: Text("Save")),
              
              
              
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
