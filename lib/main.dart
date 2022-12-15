import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/task_list.dart';
import 'package:untitled/screens/tasks_screen.dart';

//this is a new comment
void main() {
  runApp(ChangeNotifierProvider(create: (_) => TaskList(),child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: TasksScreen()
    );
  }
}






