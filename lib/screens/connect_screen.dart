import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/constants.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key, required this.profile, required this.name});

  final String profile;
  final String name;

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            ImagesAsset.o,
            height: Dimens.verticalBlockSize * 35,
            width: Dimens.screenWidth,
          ),
          Column(children: [_appBar(), _connectProfile()]),
          _bottomView(),
          Padding(
            padding: EdgeInsets.only(bottom: Dimens.verticalBlockSize * 7.8),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: AppColors.pink,
              child: Image.asset(ImagesAsset.mic, scale: 4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomView() {
    return Stack(
      children: [
        Image.asset(ImagesAsset.bottomShape),
        Padding(
          padding: EdgeInsets.only(
            top: Dimens.verticalBlockSize * 7.5,
            left: Dimens.s_70(),
            right: Dimens.s_70(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(ImagesAsset.pin, scale: 4),
              Image.asset(ImagesAsset.keyboard, scale: 4),
            ],
          ),
        ),
      ],
    );
  }

  Widget _connectProfile() {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: 'You connected with ', // default style
            style: AppTextStyle.bodyRegular[24]?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: widget.name,
                style: AppTextStyle.bodyRegular[24]?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.pink,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Dimens.verticalBlockSize * 1.5,
            bottom: Dimens.verticalBlockSize * 2.5,
          ),
          child: Text(
            '11 mins ago',
            style: AppTextStyle.bodyRegular[16]?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.white.withAlpha(200),
            ),
          ),
        ),
        CircleAvatar(
          radius: Dimens.horizontalBlockSize * 16.4,
          backgroundColor: AppColors.pink,
          child: Container(
            height: Dimens.s_110(),
            width: Dimens.s_110(),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 6),
              image: DecorationImage(
                image: AssetImage(widget.profile),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Dimens.verticalBlockSize * 4,
            bottom: Dimens.verticalBlockSize * 3,
          ),
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: 'Know when ', // default style
              style: AppTextStyle.bodyRegular[16]?.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: widget.name,
                  style: AppTextStyle.bodyRegular[16]?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.pink,
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: ' has read your \nmessage',
                  style: AppTextStyle.bodyRegular[16]?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: AppColors.pink,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImagesAsset.read, scale: 4),
              SizedBox(width: 5),
              Text(
                'Get Read Receipts',
                style: AppTextStyle.bodyRegular[14]?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _appBar() {
    return SafeArea(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: Dimens.s_15()),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: Dimens.s_45(),
              width: Dimens.s_45(),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white12),
              ),
              child: Image.asset(
                ImagesAsset.backIc,
                scale: 3.6,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
