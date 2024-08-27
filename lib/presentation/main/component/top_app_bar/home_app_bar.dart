import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../core/theme/custom/custom_theme.dart';
import '../../cubit/mall_type_cubit.dart';

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
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppIcons.mainLogo,
                  colorFilter: ColorFilter.mode(
                      state.isMarket
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn),
                ),
              ),
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
                    labelColor: state.isMarket
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.background,
                    unselectedLabelColor: state.isMarket
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context).colorScheme.contentPrimary,
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
                        color: state.isMarket
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.primary),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    AppIcons.location,
                    colorFilter: ColorFilter.mode(
                        state.isMarket
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.contentPrimary,
                        BlendMode.srcIn),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    AppIcons.cart,
                    colorFilter: ColorFilter.mode(
                        state.isMarket
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.contentPrimary,
                        BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
