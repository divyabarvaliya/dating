import 'package:dating/core/controller/main_controller.dart';
import 'package:dating/screens/discover_screen.dart';
import 'package:dating/screens/home_screen.dart';
import 'package:dating/screens/matches_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          Obx(() => pageView()),
          Obx(()=>
           AnimatedPositioned(
              left: 0,
              right: 0,
              duration: Duration(milliseconds: 700),
              bottom:
                  !MainController.to.isScrollingDown.value
                      ? 0
                      : -Dimens.verticalBlockSize * 12,

              // right: 0,
              // left: 0,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimens.s_25(),
                  vertical: Dimens.verticalBlockSize * 2.5,
                ),
                width: Dimens.screenWidth,
                height: Dimens.verticalBlockSize * 8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  // image: DecorationImage(
                  //   image: AssetImage(ImagesAsset.bottomBac),
                  //   fit: BoxFit.fill,
                  // ),
                ),
                child: Obx(
                  () => Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedPositioned(
                        left:
                            Dimens.horizontalBlockSize *
                            MainController.to.left.value,
                        top: 0,
                        bottom: 0,
                        duration: Duration(milliseconds: 400),
                        child: Container(
                          height: Dimens.s_45(),
                          width: Dimens.s_45(),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.pink,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimens.s_25()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            MainController.to.iconList.length,
                            (i) => InkWell(
                              onTap: () {
                                _changeBoxPos(i);
                                MainController.to.selIn.value = i;
                              },
                              child: AnimatedPadding(
                                duration: Duration(milliseconds: 400),
                                padding: EdgeInsets.only(bottom: 0),
                                child: Image.asset(
                                  MainController.to.selIn.value == i
                                      ? MainController.to.selIconList[i]
                                      : MainController.to.iconList[i],
                                  scale: 3.5,
                                  color:
                                      MainController.to.selIn.value != i
                                          ? Color(0xffA58AA5)
                                          : MainController.to.selIn.value == 2
                                          ? Colors.white
                                          : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pageView() {
    switch (MainController.to.selIn.value) {
      case 0:
        return HomeScreen();
      case 1:
        return DiscoverScreen();
      case 2:
        return HomeScreen();
      case 3:
        return MatchesScreen();
      case 4:
        return HomeScreen();
      default:
        return HomeScreen();
    }
  }

  _changeBoxPos(int i) {
    if (i == 0) {
      MainController.to.left.value = 4.4;
    } else if (i == 1) {
      MainController.to.left.value = 20.4;
    } else if (i == 2) {
      MainController.to.left.value = 36.7;
    } else if (i == 3) {
      MainController.to.left.value = 53;
    } else if (i == 4) {
      MainController.to.left.value = 69.5;
    }
  }
}
