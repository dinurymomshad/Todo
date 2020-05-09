import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskTitle;
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "ADD TASK",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  border: InputBorder.none,
                  labelText: "Task Name",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
              textAlign: TextAlign.start,
              cursorWidth: 2.0,
              onChanged: (newTask) {
                taskTitle = newTask;
              },
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  border: InputBorder.none,
                  labelText: "Due Date",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
              textAlign: TextAlign.start,
              cursorWidth: 2.0,
              onChanged: (newProject) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black12,
                          border: InputBorder.none,
                          //icon: Icon(Icons.category),
                          labelText: "Add Category"),
                      textAlign: TextAlign.start,
                      onChanged: (newProject) {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black12,
                          border: InputBorder.none,
                          //icon: Icon(Icons.priority_high),
                          labelText: "Add Priority"),
                      textAlign: TextAlign.start,
                      onChanged: (newProject) {},
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Add a Description",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
              ),
              textAlign: TextAlign.start,
              onChanged: (newProject) {},
            ),
            SizedBox(height: 10),
            MaterialButton(
              child: Text("Create Task",
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              minWidth: 200.0,
              height: 45,
              color: Colors.blue[500],
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
