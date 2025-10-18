import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _pageTitle()));
  }

  Widget _pageTitle() {
    return const Text(
      '#GoMoon',
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _astroMoonImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/astro_moon.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _destinationDropDown() {
    List<DropdownMenuItem<String>> destinations =
        ['Moon', 'Mars', 'Europa', 'Titan'].map<DropdownMenuItem<String>>((
          String value,
        ) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: const TextStyle(color: Colors.white)),
          );
        }).toList();

    return DropdownButton<String>(
      value: 'Moon',
      items: destinations,
      onChanged: (String? newValue) {},
      dropdownColor: const Color.fromARGB(255, 50, 50, 50),
      underline: Container(),
      iconEnabledColor: Colors.white,
    );
  }
}
