import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskManager(),
      child: 
 MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Task Manager'),
          ),
          body: TaskList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class TaskManager extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }
}

class Task {
  String title;
  String description;
  DateTime dueDate;
  bool isCompleted;

  Task({required this.title, required this.description, required this.dueDate, this.isCompleted = false});
}

class TaskList  
 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskManager = Provider.of<TaskManager>(context);
    return ListView.builder(
      itemCount: taskManager.tasks.length,
      itemBuilder: (context, index) {
        final task = taskManager.tasks[index];
        return 
 ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
          trailing: Checkbox(
            value: task.isCompleted,
            onChanged: (value) {
              task.isCompleted  = value!;
              taskManager.notifyListeners();
            },
          ),
        );
      },
    );
  }
}