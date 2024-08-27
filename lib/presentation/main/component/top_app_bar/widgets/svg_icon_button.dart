import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/constant/app_icons.dart';

class SvgIconButton extends StatelessWidget {
  final double padding;
  final String icon;
  final Color color;


  const SvgIconButton({super.key, required this.icon, required this.color, this.padding = 4.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn),
      ),
    );
  }
}
