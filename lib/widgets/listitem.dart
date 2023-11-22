import 'package:flutter/material.dart';
class ListTaskItem extends StatelessWidget {
  final String title,describe,date;
  final VoidCallback deletdtap,edittap;
  ListTaskItem({
    super.key, required this.title, required this.describe, required this.date, required this.deletdtap, required this.edittap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(describe),
            Text(date),
            Row(
              children: [
                Chip(label: Text('New'),backgroundColor: Colors.blue,),
                Spacer(),
                IconButton(onPressed: deletdtap, icon: Icon(Icons.delete)),
                IconButton(onPressed: edittap, icon:Icon(Icons.edit)),

              ],
            ),
          ],
        ),
      ),

    );
  }
}