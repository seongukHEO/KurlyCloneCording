import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_theme.dart';
import '../../cubit/bottom_navi_cubit.dart';
import '../../cubit/mall_type_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key, required this.bottomNavi});

  final BottomNavi bottomNavi;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (_, state) {
        return Container(
          color: (state.isMarket)
              ?Theme.of(context).colorScheme.primary
              :Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            child: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(bottomNavi.toName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: (state.isMarket)
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context).colorScheme.contentPrimary
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
