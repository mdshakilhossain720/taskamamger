import 'package:flutter/material.dart';

import 'package:taskmanagertwo/data/networkutils.dart';
import 'package:taskmanagertwo/data/uitils.dart';
import 'package:taskmanagertwo/data/urls.dart';
import 'package:taskmanagertwo/widgets/background.dart';
import '../../utils/textstyle.dart';
import '../../widgets/appbutton.dart';
import '../../widgets/text_formfieldresuable.dart';
import '../screen/bottomnavbar.dart';
import 'signup.dart';
import 'verifyemail.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();

  @override
  void dispose(){
    emailcontroller.clear();
    passwordcontroller.clear();
    super.dispose();


  }
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  bool isloadin=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(child:

      Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Get Started With",style: Bigtitletext()),
            SizedBox(height: 24,),
            AppTextFormField(
            validator: (value){
              if(value?.isEmpty??true){
                return "Enter your password";
              }
            }
            ,controller: TextEditingController(), hintext: 'email',),
            SizedBox(height: 15,),
            AppTextFormField(
              validator: (value){
                if(value?.isEmpty?? true){
                  return "Enter your password";
                }
              },
              controller: TextEditingController(), hintext: 'Password',obscuretext: true,),
            SizedBox(height: 15,),

            if(isloadin)
              Center(
                child: CircularProgressIndicator(),
              )
            else
            AppButton(ontap: () async {
              if(formkey.currentState!.validate()){
                isloadin=true;
                setState(() {

                });
                final result= await NetworkUtils().postApi(Urls.login,


                body: {
                  "email":emailcontroller.text.trim(),
                  "password":passwordcontroller.text.trim(),
                },
                    unAuthorized: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("email or pasword increet",)));
                    }

                );
                isloadin=false;
                setState(() {

                });

                if(result !=null && result['status']=='success'){
                 await AuthUitils().getData(result['data']['firstName'], result['data']['lastName'],
                      result['data']['mobile'], result['token'], result['data']['photo'],result['data']['email']);
                  
                  



                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (contex)=>BottomNavBar()),
                         (route) => false);
                }
              }



            }, text: Icon(Icons.arrow_forward),),
            SizedBox(height: 10,),
            Center(
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyEmail()));
              }, child: Text("Forget Password",
                style: TextStyle(fontSize: 18,color: Colors.grey),)),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have account?"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (contex)=>SignUp()));

                }, child: Text("Sign up",style: TextStyle(color: Colors.green),)),

              ],
            )



        ],),
      )),
    );
  }
}




