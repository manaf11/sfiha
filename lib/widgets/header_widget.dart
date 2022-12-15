import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {

  Color clr1 = Colors.blue;
  Color clr2 = Colors.white;

  late int taskNumbers;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(radius: 44, backgroundColor: clr2, child: Icon(Icons.list, color: clr1,),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,),
            child: Text("TODOEY", style: TextStyle(color: clr2, fontWeight: FontWeight.bold, fontSize: 22),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taskNumbers > 1?"$taskNumbers Tasks": "$taskNumbers Task", style: TextStyle(color: clr2.withOpacity(0.7), fontWeight: FontWeight.w400, fontSize: 18),),
          ),
        ],
      ),
    );
  }

  HeaderWidget({
    required this.taskNumbers,
  });
}
