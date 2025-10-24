import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly/models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightDevice = 0;
  double _widthDevice = 0;

  String? _taskContent;
  late Box _box;

  @override
  void initState() {
    super.initState();
    _box = Hive.box('tasks');
  }

  @override
  Widget build(BuildContext context) {
    _heightDevice = MediaQuery.of(context).size.height;
    _widthDevice = MediaQuery.of(context).size.width;

    print("input value: $_taskContent");
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
    List tasks = _box.values.toList();

    if (tasks.isEmpty) {
      return Center(
        child: Text(
          'No tasks yet! Tap + to add one.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        var taskMap = Map<String, dynamic>.from(tasks[index]);
        Task task = Task.fromMap(taskMap);

        return ListTile(
          title: Text(
            task.content,
            style: TextStyle(
              decoration: task.done ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            '${task.timestamp.day}/${task.timestamp.month}/${task.timestamp.year} ${task.timestamp.hour}:${task.timestamp.minute.toString().padLeft(2, '0')}',
          ),
          trailing: Checkbox(
            value: task.done,
            onChanged: (value) {
              task.done = value!;
              _box.putAt(index, task.toMap());
              setState(() {});
            },
          ),
          leading: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              _box.deleteAt(index);
              setState(() {});
            },
          ),
        );
      },
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
        onSubmitted: (_value) {},
        onChanged: (_value) {
          setState(() {
            _taskContent = _value;
          });
        },
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
            if (_taskContent != null && _taskContent!.isNotEmpty) {
              Task newTask = Task(
                content: _taskContent!,
                timestamp: DateTime.now(),
                done: false,
              );
              _box.add(newTask.toMap());
              setState(() {
                _taskContent = null;
              });
              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
