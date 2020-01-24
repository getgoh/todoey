import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasks_tile.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, TaskData taskData, Widget child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.removeTask(task);
              },
            );
          },
        );
      },
    );
  }
}

//ListView(
//children: <Widget>[
//TaskTile(taskTitle: tasks[0].name, isChecked: tasks[0].isDone),
//TaskTile(taskTitle: tasks[1].name, isChecked: tasks[1].isDone),
//TaskTile(taskTitle: tasks[2].name, isChecked: tasks[2].isDone),
//],
//);
