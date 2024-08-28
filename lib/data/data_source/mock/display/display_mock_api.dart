import 'dart:convert';

import '../../../dto/display/menu/menu.dto.dart';
import '../../remote/display.api.dart';

class DisplayMockApi implements DisplayApi{
  @override
  Future<List<MenuDto>> getMenusByMallType(String mallType) {
    // TODO: implement getMenusByMallType
    throw UnimplementedError();
  }

  //String을 MenuDto로 바꿔주는 Parser
  List<MenuDto> _menuParser(String source){
    List<MenuDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => MenuDto.fromJson(e)).toList();
    return menus;
  }

}