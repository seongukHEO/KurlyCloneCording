import 'package:bloc/bloc.dart';

enum BottomNavi{home, category, search, user}

class BottomNaviCubit extends Cubit<BottomNavi>{
  BottomNaviCubit() : super(BottomNavi.home);

  void changeIndex(int index){
    return emit(BottomNavi.values[index]);
  }


}