import 'package:flutter/material.dart';

import '../../widgets/background.dart';
import '../../widgets/cardtask.dart';
import '../../widgets/listitem.dart';
class Canceltask extends StatelessWidget {
  const Canceltask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(child: Column(
        children: [
          Row(
            children: [
              cardresuabletask(type: 'NEW', number: '12',),
              cardresuabletask(type: 'NEW', number: '12',),
              cardresuabletask(type: 'NEW', number: '12',),
              cardresuabletask(type: 'NEW', number: '12',),
            ],
          ),

          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context,index){
                  return  ListTaskItem(title: 'title', describe: 'Described', date: '10/12/2021',
                    deletdtap: () {}, edittap: () {},);
                }),
          ),
        ],
      )),
    );
  }
}
