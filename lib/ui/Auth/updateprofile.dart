import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskmanagertwo/data/uitils.dart';

import '../../utils/textstyle.dart';
import '../../widgets/appbutton.dart';
import '../../widgets/background.dart';
import '../../widgets/text_formfieldresuable.dart';
import '../../widgets/userprofile.dart';
class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController firstNamecontroller=TextEditingController();
  final TextEditingController lastNamecontroller=TextEditingController();
  final TextEditingController phonecontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();

  @override
  void initState(){
    emailcontroller.text=AuthUitils().email ?? "";
    firstNamecontroller.text=AuthUitils().firstName ?? "";
    lastNamecontroller.text=AuthUitils().lastName ?? "";
    phonecontroller .text=AuthUitils().phone ?? "";

    super.initState();


  }
  GlobalKey<FormState>  formkey=GlobalKey<FormState>();

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

                  InkWell(
                    onTap: () async {
                      final XFile? imagepicker=await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(imagepicker != null){
                        setState(() {

                        });
                      }
                    },
                    child: Row(
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
                           //child: Text(imagepicker.name),
                          ),
                        )
                      ],
                    ),
                  ),
                  AppTextFormField(controller: emailcontroller, hintext:'email'),
                  SizedBox(height: 10,),
                  AppTextFormField(
                      controller: firstNamecontroller, hintext: 'FirstName'),
                     SizedBox(height: 10,),
                  AppTextFormField(controller: lastNamecontroller, hintext:'LastName'),
                  SizedBox(height: 10,),
                  AppTextFormField(controller:phonecontroller, hintext:'Phone Number'),
                  SizedBox(height: 10,),
                  AppTextFormField(controller: passwordcontroller, hintext:'Password'),
                  SizedBox(height: 20,),
                  AppButton(ontap: (){}, text: Text("Save"),),



                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
