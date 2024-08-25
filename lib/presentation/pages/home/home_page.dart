import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("홈"),
      ),
      body: Center(
        child: Text('homepage', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
