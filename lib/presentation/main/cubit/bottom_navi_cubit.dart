import 'package:bloc/bloc.dart';

import '../../../core/theme/constant/app_icons.dart';

enum BottomNavi{home, category, search, user}

class BottomNaviCubit extends Cubit<BottomNavi>{
  BottomNaviCubit() : super(BottomNavi.home);

  void changeIndex(int index){
    return emit(BottomNavi.values[index]);
  }


}

extension BottomNaviX on BottomNavi{
  String get icon{
    switch(this){
      case BottomNavi.home:
        return AppIcons.navHome;
      case BottomNavi.category:
        return AppIcons.navCategory;
      case BottomNavi.search:
        return AppIcons.navSearch;
      case BottomNavi.user:
        return AppIcons.navUser;
    }
  }

  String get activeIcon{
    switch(this){
      case BottomNavi.home:
        return AppIcons.navHomeOn;
      case BottomNavi.category:
        return AppIcons.navCategoryOn;
      case BottomNavi.search:
        return AppIcons.navSearchOn;
      case BottomNavi.user:
        return AppIcons.navUserOn;
    }
  }

  String get toName{
    switch(this){
      case BottomNavi.home:
        return '홈';
      case BottomNavi.category:
        return '카테고리';
      case BottomNavi.search:
        return '검색';
      case BottomNavi.user:
        return '마이페이지';
    }
  }
}