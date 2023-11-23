import 'package:flutter/material.dart';
import 'package:taskmanagertwo/ui/Auth/login_screen.dart';

import '../data/uitils.dart';
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
      title: Text('${(AuthUitils().firstName ?? "")+(AuthUitils().lastName ?? "")}'),

      subtitle: Text(AuthUitils().email ?? ""),
      leading: Icon(Icons.person),

      trailing: IconButton(onPressed: () async {
            await AuthUitils().clearData();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()),
                    (route) => false);

      }, icon: Icon(Icons.logout)),

    );
  }
}