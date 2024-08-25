import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("스플래시"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("splashScreen"),
            ElevatedButton(
                onPressed: () => context.go(RoutePath.home),
                child: Text("화면 넘기기")
            ),
          ],
        ),
      ),
    );
  }
}
