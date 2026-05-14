import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoHome(),
    );
  }
}

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {

  TextEditingController taskController = TextEditingController();

  List<String> taskList = [
    "Task 01",
    "Task 02",
    "Hello world",
    "helloo",
    "hai",
    "task 03"
  ];

  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        taskList.add(taskController.text);
        taskController.clear();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List App"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: Column(
          children: [

            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: "Enter a task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(width: 10),

                ElevatedButton(
                  onPressed: addTask,
                  child: Text("Add"),
                ),
              ],
            ),

            SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: taskList.length,

                itemBuilder: (context, index) {

                  return Row(
                    children: [

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(taskList[index]),
                        ),
                      ),

                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),

                        onPressed: () {
                          deleteTask(index);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
