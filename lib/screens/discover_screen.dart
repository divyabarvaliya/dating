import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dating/core/controller/main_controller.dart';
import 'package:dating/core/model/people_model.dart';
import 'package:dating/core/widgets/entry_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/constants.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: Dimens.verticalBlockSize * 10),
                child: Column(
                  children: [_disFriends(), _interest(), _mapView()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.s_18()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Around me',
            style: AppTextStyle.bodyRegular[20]?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.darPurple,
            ),
          ),
          SizedBox(height: Dimens.verticalBlockSize * 0.9),
          Text.rich(
            TextSpan(
              text: 'People with', // default style
              style: AppTextStyle.bodyRegular[14]?.copyWith(
                fontWeight: FontWeight.w400,
                color: Color(0xff6C727F),
              ),
              children: [
                TextSpan(
                  text: '“Music”',
                  style: AppTextStyle.bodyRegular[14]?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.pink,
                  ),
                ),
                TextSpan(
                  text: 'interest around you',
                  style: AppTextStyle.bodyRegular[14]?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6C727F),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimens.verticalBlockSize * 2.5),
          Image.asset(ImagesAsset.map),
        ],
      ),
    );
  }

  Widget _interest() {
    return Padding(
      padding: EdgeInsets.symmetric(
        // horizontal: Dimens.s_15(),
        vertical: Dimens.verticalBlockSize * 4,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Dimens.s_15(),
              right: Dimens.s_15(),
              bottom: Dimens.verticalBlockSize * 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Interest',
                  style: AppTextStyle.bodyRegular[20]?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.darPurple,
                  ),
                ),
                Text(
                  'View all',
                  style: AppTextStyle.bodyRegular[16]?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.pink,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Wrap(
              spacing: Dimens.s_8(), // gap between adjacent chips
              runSpacing: Dimens.verticalBlockSize * 1.5, // gap between lines
              children:
                  MainController.to.interest.map((interest) {
                    return GestureDetector(
                      onTap: () {
                        interest.isSelected = true;
                        MainController.to.interest.refresh();
                      },
                      child: EntryListItem(
                        index: MainController.to.interest.indexOf(interest),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimens.verticalBlockSize * 1.2,
                            horizontal: Dimens.s_10(),
                          ),
                          decoration: BoxDecoration(
                            color: interest.isSelected ? AppColors.pink : null,
                            border: Border.all(
                              color: AppColors.primary.withAlpha(70),
                            ),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Text(
                            interest.title,
                            style: AppTextStyle.bodyRegular[16]?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _disFriends() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: Dimens.s_15()),
        child: Row(
          children: List.generate(MainController.to.discoverM.length, (i) {
            PeopleModel dis = MainController.to.discoverM[i];
            return EntryListItem(
              index: i,
              child: Container(
                margin: EdgeInsets.only(right: Dimens.s_10()),
                height: Dimens.verticalBlockSize * 20,
                width: Dimens.horizontalBlockSize * 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(dis.profile),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff4B164C).withAlpha(0),
                            Color(0xff4B164C).withAlpha(200),
                          ], // Start → End colors
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: Dimens.verticalBlockSize * 20,
                      width: Dimens.horizontalBlockSize * 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary,
                        border: Border.all(color: AppColors.pink),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5,
                        ),
                        child: Text(
                          'NEW',
                          style: AppTextStyle.bodyRegular[12]?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white38),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: BlurryContainer(
                                blur: 15,
                                elevation: 0,
                                color: Colors.white10,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 8,
                                ),
                                borderRadius: BorderRadius.circular(32),
                                child: Text(
                                  '${dis.distance} Km away',
                                  style: AppTextStyle.bodyRegular[12]?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${dis.name}, ${dis.age}',
                                style: AppTextStyle.bodyRegular[14]?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  height: 1.8,
                                ),
                              ),
                              if (dis.isOnline) SizedBox(width: 5),
                              if (dis.isOnline)
                                CircleAvatar(
                                  backgroundColor: AppColors.lightGreen,
                                  radius: 4,
                                ),
                            ],
                          ),
                          Text(
                            dis.location,
                            style: AppTextStyle.bodyRegular[10]?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _appBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.s_15()),
        child: EntryListItem(
          index: 0,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(ImagesAsset.location, scale: 3),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          'Germany',
                          style: AppTextStyle.bodyRegular[12]?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.darPurple,
                          ),
                        ),
                      ),
                      Image.asset(ImagesAsset.down, scale: 3),
                    ],
                  ),
                  SizedBox(height: Dimens.verticalBlockSize * 0.5),
                  Text(
                    'Discover',
                    style: AppTextStyle.bodyRegular[24]?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: Dimens.s_45(),
                width: Dimens.s_45(),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary.withAlpha(50)),
                ),
                child: Image.asset(ImagesAsset.search, scale: 3.6),
              ),
              SizedBox(width: 16),
              Container(
                height: Dimens.s_45(),
                width: Dimens.s_45(),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary.withAlpha(50)),
                ),
                child: Image.asset(ImagesAsset.setting, scale: 3.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
