import 'package:flutter/material.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program'),
      ),
      body: Container(
        child: Center(
          child: Text('Program'),
        ),
        color: Colors.purple,
      ),
    );
  }
}