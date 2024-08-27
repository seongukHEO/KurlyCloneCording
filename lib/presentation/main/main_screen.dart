import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/constant/app_icons.dart';
import '../pages/category/category_page.dart';
import '../pages/home/home_page.dart';
import '../pages/search/search_page.dart';
import '../pages/user/user_page.dart';
import 'component/top_app_bar/top_app_bar.dart';
import 'cubit/bottom_navi_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => BottomNaviCubit(), child: MainScreenView(),);
  }
}


class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: BlocBuilder<BottomNaviCubit, BottomNavi>(builder: (_, state){
        switch(state){
          case BottomNavi.home:
            return HomePage();
          case BottomNavi.category:
            return CategoryPage();
          case BottomNavi.search:
            return SearchPage();
          case BottomNavi.user:
            return UserPage();
        }
      },),
      bottomNavigationBar: BlocBuilder<BottomNaviCubit, BottomNavi>(
        builder: (_, state) {
          return BottomNavigationBar(
            items: List.generate(BottomNavi.values.length, (index) =>
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(BottomNavi.values[index].icon),
                    label: BottomNavi.values[index].toName,
                    activeIcon: SvgPicture.asset(BottomNavi.values[index].activeIcon)
                ),
            ),
            currentIndex: state.index,
            onTap: (index) => context.read<BottomNaviCubit>().changeIndex(index),
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
          );
        }
      ),
    );
  }
}
