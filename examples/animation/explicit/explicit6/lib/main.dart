import 'dart:async';

import 'package:flutter/material.dart';

class BouncingBallDemo extends StatefulWidget {
  const BouncingBallDemo({super.key});

  @override
  State<BouncingBallDemo> createState() => _BouncingBallDemoState();
}

class _BouncingBallDemoState extends State<BouncingBallDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 100,
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: controller.value),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        width: 40,
        height: 40,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: BouncingBallDemo(),
        ),
      ),
    );
  }
}

Future<void> main() async {
  runApp(
    const MyApp(),
  );
}
