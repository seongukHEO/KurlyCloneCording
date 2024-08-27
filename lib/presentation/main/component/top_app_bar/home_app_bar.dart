import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../core/theme/custom/custom_theme.dart';
import '../../cubit/mall_type_cubit.dart';
import 'widgets/svg_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (_, state) {
      return Container(
        color: (state.isMarket)
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.background,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: SvgIconButton(icon: AppIcons.mainLogo, padding: 8.0, color: state.Theme.logoColor,),
              leadingWidth: 86,
              centerTitle: true,
              title: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                //color: state.isMarket ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.surface,
                //decoration: BoxDecoration(borderRadius: BorderRadius.circular()),
                height: 28,
                child: DefaultTabController(
                  initialIndex: state.index,
                  length: MallType.values.length,
                  child: TabBar(
                    onTap: (index) =>
                        context.read<MallTypeCubit>().changeIndex(index),
                    //Todo 나중에 별물결 할 때 이거 꼭 참고하자
                    splashBorderRadius: BorderRadius.circular(30),
                    labelColor: state.Theme.labelColor,
                    unselectedLabelColor: state.Theme.unselectedLabelColor,
                    labelStyle: Theme.of(context).textTheme.labelLarge.bold,
                    labelPadding: EdgeInsets.symmetric(horizontal: 12),
                    dividerColor: Colors.transparent,
                    tabs: List.generate(
                        MallType.values.length,
                        (index) => Tab(
                              text: MallType.values[index].toName,
                            )),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: state.Theme.indicatorColor),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
              ),
              actions: [
                SvgIconButton(icon: AppIcons.location, color: state.Theme.iconColor),
                SvgIconButton(icon: AppIcons.cart, color: state.Theme.iconColor)
              ],
            ),
          ),
        ),
      );
    });
  }
}
