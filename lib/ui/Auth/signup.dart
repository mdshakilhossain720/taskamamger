import 'package:flutter/material.dart';
import 'package:taskmanagertwo/data/networkutils.dart';
import 'package:taskmanagertwo/ui/Auth/login_screen.dart';
import 'package:taskmanagertwo/utils/textstyle.dart';
import 'package:taskmanagertwo/widgets/appbutton.dart';
import 'package:taskmanagertwo/widgets/background.dart';
import 'package:taskmanagertwo/widgets/text_formfieldresuable.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController firsstNamecontroller=TextEditingController();
  final TextEditingController lastNamecontroller=TextEditingController();
  final TextEditingController phonecontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();

  @override
  void dispose(){
    emailcontroller.clear();
    firsstNamecontroller.clear();
    lastNamecontroller.clear();
    phonecontroller.clear();
    passwordcontroller.clear();
    super.dispose();


  }


  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  bool isloading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(child: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Text("JOIN WITH US",style: Bigtitletext(),),
                SizedBox(height: 15,),

                AppTextFormField(
                    validator: (value){
                      if(value?.isEmpty ?? true){
                        return "Enter your email";
                      }
                      return null;
                    },
                    controller: emailcontroller, hintext:"Email"),
                SizedBox(height: 10,),

                AppTextFormField(
                    validator: (value){
                      if(value?.isEmpty ?? true){
                        return "Enter your email";
                      }
                      return null;
                    },
                    controller: firsstNamecontroller, hintext:"FirstName"),
                SizedBox(height: 10,),

                AppTextFormField(
                    validator: (value){
                      if(value?.isEmpty ?? true){
                        return "Enter your email";
                      }
                      return null;
                    },
                    controller: lastNamecontroller, hintext:"LastName"),
                SizedBox(height: 10,),

                AppTextFormField(
                    validator: (value){
                      if((value?.isEmpty ?? true)&& (value?.length?? 0)<11){
                        return "Enter your email";
                      }
                      return null;
                    },
                    controller: phonecontroller, hintext:"Phone"),
                SizedBox(height: 10,),

                AppTextFormField(
                    validator: (value){
                      if((value?.isEmpty ?? true)&& (value?.length ?? 0)<6){
                        return "Enter your email";
                      }
                      return null;
                    },
                    controller: passwordcontroller, hintext:"Password"),
                SizedBox(height: 10,),
               if(isloading)
                 Center(
                   child: CircularProgressIndicator(),
                 )
                 else
                AppButton(ontap: () async {
                  if(formkey.currentState!.validate()){
                    isloading=true;
                    setState(() {

                    });

                    final result=await NetworkUtils().postApi("https://task.teamrabbil.com/api/v1/registration",


                    body: {
                      "email":emailcontroller.text.trim(),
                      "firstName":firsstNamecontroller.text.trim(),
                      "lastName":lastNamecontroller.text.trim(),
                      "mobile":phonecontroller.text.trim(),
                      "password":passwordcontroller.text.trim(),
                    }

                    );
                    isloading=false;
                    setState(() {

                    });
                    if(result !=null && result['status']=='"success'){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success full")));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("not success full")));
                    }

                  }

                }, text: Text("Sign up")),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" have account?"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (contex)=>LoginScreen()));

                    }, child: Text("Login",style: TextStyle(color: Colors.green),)),

                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
