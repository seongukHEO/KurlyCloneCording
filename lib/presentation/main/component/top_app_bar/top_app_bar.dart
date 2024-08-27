import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';

import '../../cubit/bottom_navi_cubit.dart';
import 'default_app_bar.dart';
import 'home_app_bar.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNaviCubit, BottomNavi>(builder: (_, state) {
      switch(state){
        case BottomNavi.home:
          return HomeAppBar();
          
        case BottomNavi.search:
        case BottomNavi.category:
        case BottomNavi.user:
          return DefaultAppBar(bottomNavi: state,);
      }
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(44);
}
