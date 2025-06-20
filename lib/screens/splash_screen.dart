import 'package:dating/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  RxBool isLoader = false.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  goToNextScreen() async {
    isLoader.value = true;
    await Future.delayed(Duration(milliseconds: 700));
    Get.to(() => DashboardScreen());
    isLoader.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: Dimens.verticalBlockSize * 4),
                    child: Image.asset(ImagesAsset.splash, scale: 4),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: Dimens.verticalBlockSize * 5,
                    bottom: Dimens.verticalBlockSize * 5,
                  ),
                  child: Text(
                    'Let’s meeting new \npeople around you',
                    style: AppTextStyle.bodyRegular[28]?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.darPurple,
                      height: 1.2,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.s_8(),
                    vertical: Dimens.verticalBlockSize,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: Dimens.s_30()),
                  height: Dimens.verticalBlockSize * 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: AppColors.primary,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(ImagesAsset.call),
                      ),
                      Text(
                        'Login with Phone',
                        style: AppTextStyle.bodyRegular[16]?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimens.verticalBlockSize * 2.5),
                GestureDetector(
                  onTap: () {
                    goToNextScreen();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimens.s_8(),
                      vertical: Dimens.verticalBlockSize,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: Dimens.s_30()),
                    height: Dimens.verticalBlockSize * 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: AppColors.pink.withAlpha(40),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(ImagesAsset.google),
                        ),
                        Text(
                          'Login with Google',
                          style: AppTextStyle.bodyRegular[16]?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Dimens.verticalBlockSize * 5),
                Text.rich(
                  TextSpan(
                    text: 'Don’t have an account? ', // default style
                    style: AppTextStyle.bodyRegular[14]?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6C727F),
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: AppTextStyle.bodyRegular[14]?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.pink,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () =>
                isLoader.value
                    ? Container(
                      color: Colors.black.withAlpha(120),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    )
                    : SizedBox(),
          ),
        ],
      ),
    );
  }
}
