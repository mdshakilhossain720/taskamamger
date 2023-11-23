import 'dart:convert';
//import 'dart:html';
import 'dart:ui';

import 'package:http/http.dart'as http;
class NetworkUtils{

  // getMethod
  Future<dynamic> getApi(String url,{VoidCallback? unAuthorzed}) async {

    final http.Response response=await http.get(Uri.parse(url));
    try{
      if(response.statusCode==200){
        return jsonDecode(response.body);

      }else if(response.statusCode==401){
        if(unAuthorzed !=null){
          unAuthorzed();
        }
      }else{
        print("somthing is wrong");
      }

    }catch(e){
      print(e);
    }
    }
       //postMethod
    Future<dynamic> postApi(String url,{Map<String,String>?body,VoidCallback? unAuthorized,String? token}) async {
    final http.Response response=await http.post(Uri.parse(url,),
        headers: {"Content-Type": "application/json","token":token ?? ""},body: jsonEncode(body));
    try{
      if(response.statusCode==200){
        return jsonDecode(response.body);

      }else if(response.statusCode==401){
        print("UnAuthrozed");
        if(unAuthorized !=null){
          unAuthorized();
        }

      }else{
        print("something is wrong");
      }
    }catch(e){
      print(e);
    }

    }

}