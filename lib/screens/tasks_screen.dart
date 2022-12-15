import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/task_list.dart';
import 'package:untitled/widgets/header_widget.dart';

class TasksScreen extends StatelessWidget {
  var cot = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var prov1 = Provider.of<TaskList>(context).tasks;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(taskNumbers: prov1.length,),
          Expanded(child:
          Container(
          decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: ListView(
            padding: EdgeInsets.all(12),
            children: prov1.map((e) => ListTile(
              onLongPress: () => Provider.of<TaskList>(context, listen: false).deleteTask(e),
              title: Text(e.taskTitle, style: TextStyle(color: Colors.black, fontSize: 16, decoration: e.isDone!? TextDecoration.lineThrough:TextDecoration.none),),
              trailing: Checkbox(value: e.isDone,onChanged: (value) => Provider.of<TaskList>(context, listen: false).editTask(e),),
            )).toList(),
          ),
        )),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SimpleDialog(title: Center(child: Text("Add a new Task")),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(controller: cot,),
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: OutlinedButton(onPressed: (){
                    if(cot.text.length == 0)
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Insert task title")));
                    else {
                      Provider.of<TaskList>(context, listen: false).addTask(cot.text);
                      cot.clear();
                      Navigator.of(context).pop();
                    }
                  }, child: Text("Add Task")),
                ),
              )],),
            );
          },);
        },
      ),
    );
  }
}
