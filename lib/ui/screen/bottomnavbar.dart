import 'package:flutter/material.dart';
import 'package:taskmanagertwo/ui/screen/progresstask.dart';

import '../../widgets/userprofile.dart';
import 'NewTask.dart';
import 'addtonew.dart';
import 'canceltask.dart';
import 'perosontask.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectindex=0;
  final List<Widget> screen=[
    NewTask(),
    Canceltask(),
    Profresstask(),
    Persontask()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddToNew()));
      },child: Icon(Icons.add),),
           bottomNavigationBar: BottomNavigationBar(
             selectedItemColor: Colors.green,
               unselectedItemColor: Colors.black38,
               backgroundColor: Colors.white,
               showSelectedLabels: true,
               onTap: (index){
               selectindex=index;
               setState(() {

               });
               },
               currentIndex: selectindex,
               items: [
                 BottomNavigationBarItem(icon: Icon(Icons.clear),label: "clear"),
                 BottomNavigationBarItem(icon: Icon(Icons.card_travel),label: "cart"),
                 BottomNavigationBarItem(icon: Icon(Icons.email),label: "email"),
                 BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label: "perosn"),

           ]),

      body: Column(
        children: [
          userprofile(),

          Expanded(child: screen[selectindex]),
        ],
      ),
    );
  }
}


