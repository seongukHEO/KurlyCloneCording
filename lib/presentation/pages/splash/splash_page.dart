import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';

//Todo 로그인 Bloc
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //이걸 bloc로 관리?
    Timer(Duration(seconds: 2), () => context.go(RoutePath.home));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Todo 하드코딩된 값 변경할 것
      backgroundColor: Color(0xFF5F0080),
      body: Center(
        child: SvgPicture.asset('assets/svg/main_logo.svg'),
      ),
    );
  }
}
