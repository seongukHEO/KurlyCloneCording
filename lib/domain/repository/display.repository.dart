import '../../data/dto/common/response_wrapper/response_wrapper.dart';
import '../../presentation/main/cubit/mall_type_cubit.dart';
import '../model/display/menu/menu.model.dart';
import 'repository.dart';

abstract class DisplayRepository extends Repository{

  //메뉴에 리스트를 반환해주는 인터페이스..?
  Future<ResponseWrapper<List<Menu>>> getMenusByMallType({
    required MallType mallType
});
}