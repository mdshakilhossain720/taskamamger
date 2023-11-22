import 'package:flutter/material.dart';

import '../ui/Auth/updateprofile.dart';
class userprofile extends StatelessWidget {
  const userprofile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfile()));
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
      tileColor: Colors.green,
      title: Text("MD shakil Hossain"),
      subtitle: Text("mdshakil720@gmil.com"),
      leading: Icon(Icons.person),
    );
  }
}