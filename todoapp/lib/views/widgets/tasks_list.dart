import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/state_manager/task_data.dart';
import 'package:todoapp/views/widgets/shared_widgets.dart';

///Simply builds a List using listView Builder.
///One important thing: TaskList will handle all of the sort of logic
///and just pass data to TaskTile that needs to displayed.
///TaskTile will be simple.
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(0.0),
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.title,
              isChecked: task.isDone,
              priorityIconData: task.priority,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
        );
      },
    );
  }
}
