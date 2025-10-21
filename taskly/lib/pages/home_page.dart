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
      body: Center(
        child: Text(
          'Welcome to Taskly!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
