

import 'package:flutter/material.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavBarPage extends StatefulWidget{
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_BottomNavBarPageState();

}
class  _BottomNavBarPageState extends State<BottomNavBarPage>{

  final PersistentTabController _controller = PersistentTabController(initialIndex: 2);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  PersistentTabView(
        context,
        controller: _controller,
        screens: Common().screens,
        items: Common.navBarItem(),
        padding: NavBarPadding.symmetric(horizontal: Dimension.height08),
        backgroundColor: AppColors.whiteColor,
        handleAndroidBackButtonPress: true,
        stateManagement: true,
        confineInSafeArea: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        navBarHeight: Dimension.height63,

        decoration: NavBarDecoration(
          border: Border.all(
            color: AppColors.lightLBCardColor,
            width: 1.0,
          ),
        ),
        itemAnimationProperties: const ItemAnimationProperties(
            curve: Curves.ease,
            duration: Duration(milliseconds: 200)
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200)
        ),
        navBarStyle: NavBarStyle.style3,

    );
  }

}