import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dating/core/controller/main_controller.dart';
import 'package:dating/core/model/people_model.dart';
import 'package:dating/core/widgets/entry_list_item.dart';
import 'package:flutter/material.dart';

import '../core/constants/constants.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_appBar(), _likeConnectList(), _matchesList()],
      ),
    );
  }

  Widget _likeConnectList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.s_15()),
      child: Row(
        children: [
          _likeConnectItem(
            backImg: ImagesAsset.p_4,
            ic: ImagesAsset.heart,
            cmt: 'Likes 32',
          ),
          SizedBox(width: Dimens.s_15()),
          _likeConnectItem(
            backImg: ImagesAsset.p_5,
            ic: ImagesAsset.wChat,
            cmt: 'Connect 15',
          ),
        ],
      ),
    );
  }

  Widget _matchesList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.s_15()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimens.verticalBlockSize * 3,
            ),
            child: Text.rich(
              TextSpan(
                text: 'Your Matches', // default style
                style: AppTextStyle.bodyRegular[20]?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.darPurple,
                ),
                children: [
                  TextSpan(
                    text: ' ${MainController.to.matches.length}',
                    style: AppTextStyle.bodyRegular[20]?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.pink,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimens.verticalBlockSize * 64,
            child: GridView.builder(
              controller: MainController.to.scrollViewController,
              itemCount: MainController.to.matches.length,
              padding: EdgeInsets.only(bottom: 100),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items per row
                crossAxisSpacing: 12, // horizontal spacing
                mainAxisSpacing: 12, // vertical spacing
                childAspectRatio: 1 / 1.5, // width/height ratio
              ),
              itemBuilder: (BuildContext context, int i) {
                PeopleModel matchP = MainController.to.matches[i];
                return EntryListItem(
                  index: i,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.pink, width: 3.3),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(matchP.profile),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff4B164C).withAlpha(0),
                                Color(0xff4B164C),
                              ], // Start → End colors
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: AppColors.pink,
                            border: Border.all(color: AppColors.pink),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 3,
                            ),
                            child: Text(
                              '${matchP.matchPer} Match',
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
                                      '${matchP.distance} Km away',
                                      style: AppTextStyle.bodyRegular[12]
                                          ?.copyWith(
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
                                    '${matchP.name}, ${matchP.age}',
                                    style: AppTextStyle.bodyRegular[14]
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          height: 1.8,
                                        ),
                                  ),
                                  if (matchP.isOnline) SizedBox(width: 5),
                                  if (matchP.isOnline)
                                    CircleAvatar(
                                      backgroundColor: AppColors.lightGreen,
                                      radius: 4,
                                    ),
                                ],
                              ),
                              Text(
                                matchP.location,
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
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _likeConnectItem({
    required String backImg,
    required String ic,
    required String cmt,
  }) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            EntryListItem(
              index: 0,
              child: CircleAvatar(
                radius: Dimens.s_30(),
                backgroundColor: AppColors.pink,
                child: Container(
                  height: Dimens.s_55(),
                  width: Dimens.s_55(),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.bg, width: 3),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(160),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Image.asset(backImg, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
            Image.asset(ic, scale: 4),
          ],
        ),
        SizedBox(height: Dimens.verticalBlockSize * 1.2),
        EntryListItem(
          index: 0,
          child: Text.rich(
            TextSpan(
              text: cmt.split(' ')[0], // default style
              style: AppTextStyle.bodyRegular[14]?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.darPurple,
              ),
              children: [
                TextSpan(
                  text: ' ${cmt.split(' ')[1]}',
                  style: AppTextStyle.bodyRegular[14]?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.pink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _appBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.s_15()),
        child: EntryListItem(
          index: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Dimens.s_45(),
                width: Dimens.s_45(),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary.withAlpha(50)),
                ),
                child: Image.asset(ImagesAsset.backIc, scale: 3.6),
              ),
              Text(
                'Matches',
                style: AppTextStyle.bodyRegular[24]?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.darPurple,
                ),
              ),
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
