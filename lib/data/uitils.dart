
import 'package:shared_preferences/shared_preferences.dart';


class AuthUitils{
  String ? firstName,lastName,phone,token,profile,email;

  Future<void> getData(String ufistName,String ulastName,String uphone,String utoken,String uprofile,String uemail) async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', utoken);
    await sharedPreferences.setString('firstName', ufistName);
    await sharedPreferences.setString('lastName', ulastName);
    await sharedPreferences.setString('phone', uphone);
    await sharedPreferences.setString('profile', uprofile);
    await sharedPreferences.setString('email', uemail);

    firstName=ufistName;
    lastName=ulastName;
    phone=uphone;
    token=utoken;
    profile=uprofile;
    email=uemail;

  }


  Future<bool>cheeklogingstate() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String ? token=sharedPreferences.getString('token');
    if(token==null){
      return false;
    }else{
      return true;
    }

  }

  Future<void>AuthgetData() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    token=sharedPreferences.getString('token');
    firstName=sharedPreferences.getString('firstName');
    lastName=sharedPreferences.getString('lastName');
    phone=sharedPreferences.getString('phone');
    profile=sharedPreferences.getString('profile');
    email=sharedPreferences.getString('email');
  }

  Future<void>clearData() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}