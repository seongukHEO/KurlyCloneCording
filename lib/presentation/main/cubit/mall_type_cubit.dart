import 'package:cubit_form/cubit_form.dart';

enum MallType {market, beauty}

class MallTypeCubit extends Cubit<MallType>{
  MallTypeCubit() : super(MallType.market);

  //바뀌는 메서드
  void changeIndex(int index) => emit(MallType.values[index]);
}

extension MallTypeX on MallType{
  String get toName{
    switch(this){
      case MallType.market:
        return '마켓패캠';
      case MallType.beauty:
        return '뷰티패캠';
    }
  }

  bool get isMarket => this == MallType.market;
  bool get isBeauty => this == MallType.beauty;
}