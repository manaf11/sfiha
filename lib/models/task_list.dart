import 'package:flutter/material.dart';
import 'package:untitled/models/task.dart';

class TaskList with ChangeNotifier{
  List<Task> tasks = [];

  addTask(String taskTitle){
    var task = Task(taskTitle: taskTitle);
    tasks.add(task);
    notifyListeners();
  }

  deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }

  editTask(Task task){
    for(int i =0; i<tasks.length; i++){
      if(tasks[i] == task){
        tasks[i].changeStatus();
        notifyListeners();
        break;
      }

    }
  }
}