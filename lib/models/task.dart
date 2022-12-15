class Task{
  late String taskTitle;
  bool? isDone;
  DateTime? createDate;

  Task({required taskTitle, this.isDone = false, }){
    this.taskTitle = taskTitle;
    createDate= DateTime.now();
  }

  changeStatus()=> isDone = !isDone!;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task &&
          runtimeType == other.runtimeType &&
          taskTitle == other.taskTitle &&
          isDone == other.isDone &&
          createDate == other.createDate;

  @override
  int get hashCode => taskTitle.hashCode ^ isDone.hashCode;
}