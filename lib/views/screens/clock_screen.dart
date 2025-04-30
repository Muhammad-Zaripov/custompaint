import 'dart:async';
import 'package:custompaint/views/widgets/my_pointer.dart';
import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (_) {
      date = DateTime.now();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(size: Size(300, 300), painter: MyPointer(date)),
      ),
    );
  }
}
