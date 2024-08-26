import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/constant/app_icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44),
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppIcons.mainLogo),
              ),
              leadingWidth: 86,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    AppIcons.location,
                    colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.background, BlendMode.srcIn),),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    AppIcons.cart,
                    colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.background, BlendMode.srcIn),),
                ),
              ],
            ),
          ),
        )
      ),
      body: Center(child: Text("MainScreen"),),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navHome), label: 'home'),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navCategory), label: 'category'),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navSearch), label: 'search'),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navUser), label: 'user'),
        ],
      ),
    );
  }
}
