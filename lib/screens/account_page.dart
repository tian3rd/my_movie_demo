import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Container(
        color: Colors.redAccent,
        child: Center(
          child: Text('Account'),
        ),
      ),
    );
  }
}