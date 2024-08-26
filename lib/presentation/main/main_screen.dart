import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/constant/app_icons.dart';
import '../pages/category/category_page.dart';
import '../pages/home/home_page.dart';
import '../pages/search/search_page.dart';
import '../pages/user/user_page.dart';
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
            currentIndex: state.index,
            onTap: (index) => context.read<BottomNaviCubit>().changeIndex(index),
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.navHome),
                  label: 'home',
                activeIcon: SvgPicture.asset(AppIcons.navHomeOn)
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.navCategory),
                  label: 'category',
                  activeIcon: SvgPicture.asset(AppIcons.navCategoryOn)
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.navSearch),
                  label: 'search',
                  activeIcon: SvgPicture.asset(AppIcons.navSearchOn)
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.navUser),
                  label: 'user',
                  activeIcon: SvgPicture.asset(AppIcons.navUserOn)
              ),
            ],
          );
        }
      ),
    );
  }
}
