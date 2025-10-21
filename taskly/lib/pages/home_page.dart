import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightDevice = 0;
  double _widthDevice = 0;

  @override
  Widget build(BuildContext context) {
    _heightDevice = MediaQuery.of(context).size.height;
    _widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Taskly',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.red,
        toolbarHeight: _heightDevice * 0.1,
        centerTitle: false,
      ),
      body: _taskList(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _taskList() {
    return ListView(
      children: [
        ListTile(
          title: Text('Task 1'),
          subtitle: Text('This is the first task.'),
          trailing: Icon(Icons.check_box_outline_blank),
        ),
        ListTile(
          title: Text('Task 2'),
          subtitle: Text('This is the second task.'),
          trailing: Icon(Icons.check_box_outline_blank),
        ),
        ListTile(
          title: Text('Task 3'),
          subtitle: Text('This is the third task.'),
          trailing: Icon(Icons.check_box_outline_blank),
        ),
      ],
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _popupAddTask();
          },
        );
      },
      backgroundColor: Colors.red,
      child: Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _popupAddTask() {
    return AlertDialog(
      title: Text('Add New Task'),
      content: TextField(
        decoration: InputDecoration(hintText: 'Enter task details here'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Logic to add the task
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
