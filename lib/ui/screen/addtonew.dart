import 'package:flutter/material.dart';
import 'package:taskmanagertwo/data/networkutils.dart';
import 'package:taskmanagertwo/data/urls.dart';
import 'package:taskmanagertwo/utils/textstyle.dart';
import 'package:taskmanagertwo/widgets/appbutton.dart';

import 'package:taskmanagertwo/widgets/text_formfieldresuable.dart';

import '../../data/uitils.dart';
import '../../widgets/userprofile.dart';
class AddToNew extends StatefulWidget {
  const AddToNew({super.key});

  @override
  State<AddToNew> createState() => _AddToNewState();
}

class _AddToNewState extends State<AddToNew> {

  TextEditingController subjectcontroller=TextEditingController();
  TextEditingController describecontroller=TextEditingController();
  GlobalKey<FormState> formkey =GlobalKey<FormState>();

  bool isloading=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              userprofile(),
              Form(
                key:formkey,
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                   Text("ADD TO NEW ",style: Bigtitletext(),),
                    SizedBox(height: 10,),
                    AppTextFormField(
                        validator: (value){
                          if(value?.isEmpty?? true){
                            return "Enter your Text";
                          }
                        },
                        controller: subjectcontroller, hintext:'Subject'),
                    SizedBox(height: 10,),
                    AppTextFormField(
                        validator: (value){
                          if(value?.isEmpty?? true){
                            return "Enter your Text";
                          }
                        },
                        maxline: 5,
                        controller: describecontroller, hintext: 'Described'),
                    SizedBox(height: 20,),
                    AppButton(ontap: () async {
                      if(formkey.currentState!.validate()){
                        isloading=true;
                        setState(() {

                        });
                        final result=await NetworkUtils().postApi(
                          Urls.createtask,
                          token:  AuthUitils().token,
                          body: {
                            "title":subjectcontroller.text.trim(),
                            "description":describecontroller.text.trim(),
                            "status":"New"
                          }
                        );
                        if(result !=null && result ['status'] == 'success'){
                          subjectcontroller.clear();
                          describecontroller.clear();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("succesfull task")));

                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("succesfull task")));

                        }

                      }

                    }, text: Text("Save")),



                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
