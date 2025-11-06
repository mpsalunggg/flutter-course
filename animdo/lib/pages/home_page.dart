import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  bool _isAutoRepeating = false;

  double _buttonRadius = 100;

  // final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);
  double _backgroundScale = 1.0;

  AnimationController? _starAnimationController;

  @override
  void initState() {
    super.initState();
    _starAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _starAnimationController!.forward();
  }

  void _toggleAutoRepeat() {
    setState(() {
      _isAutoRepeating = !_isAutoRepeating;

      if (_isAutoRepeating) {
        _timer = Timer.periodic(Duration(seconds: 2), (timer) {
          setState(() {
            _buttonRadius = _buttonRadius == 100 ? 200 : 100;
            _backgroundScale = _backgroundScale == 1.0 ? 0.0 : 1.0;
          });
        });
      } else {
        _timer?.cancel();
        _timer = null;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _animatedBackground(),
            _autoRepeatButton(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_buttonAnimated(), _starIcon()],
            ),
          ],
        ),
      ),
    );
  }

  Widget _autoRepeatButton() {
    return Positioned(
      bottom: 50,
      right: 20,
      child: FloatingActionButton(
        onPressed: _toggleAutoRepeat,
        backgroundColor: _isAutoRepeating ? Colors.red : Colors.green,
        child: Icon(_isAutoRepeating ? Icons.stop : Icons.play_arrow),
      ),
    );
  }

  Widget _pageBackground() {
    return Container(color: Colors.blue);
  }

  Widget _buttonAnimated() {
    return Center(
      child: GestureDetector(
        onTap: () => {
          setState(() {
            _buttonRadius = _buttonRadius == 100 ? 200 : 100;
          }),
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.bounceInOut,
          height: _buttonRadius,
          width: _buttonRadius,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(_buttonRadius),
          ),
          child: const Center(
            child: Text('Tap Me', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }

  // Widget _animatedBackground() {
  //   return TweenAnimationBuilder(
  //     tween: _backgroundScale,
  //     curve: Curves.easeInOutCubic,
  //     duration: Duration(seconds: 1),
  //     builder: (_context, double _scale, _child) {
  //       return Transform.scale(scale: _scale, child: _child);
  //     },
  //     child: Container(color: Colors.blue),
  //   );
  // }

  Widget _animatedBackground() {
    return AnimatedScale(
      scale: _backgroundScale,
      curve: Curves.easeInOutCubic,
      duration: Duration(seconds: 1),
      child: Container(color: Colors.blue),
    );
  }

  Widget _starIcon() {
    return AnimatedBuilder(
      animation: _starAnimationController!.view,
      builder: (_buildContext, _child) {
        return Transform.rotate(
          angle: _starAnimationController!.value * 2 * pi,
          child: _child,
        );
      },
      child: const Icon(Icons.star, size: 100, color: Colors.white),
    );
  }
}
