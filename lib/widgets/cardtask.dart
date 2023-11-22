import 'package:flutter/material.dart';
class cardresuabletask extends StatelessWidget {
  final String type;
  final String number;
  const cardresuabletask({required this.type,required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(number,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            Text(type),
          ],
        ),
      ),
    );
  }
}