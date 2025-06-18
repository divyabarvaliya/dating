import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dating/core/controller/main_controller.dart';
import 'package:dating/core/model/friends_model.dart';
import 'package:dating/core/model/make_frd_model.dart';
import 'package:dating/core/widgets/entry_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxBool isAlignLeft = true.obs;
  RxDouble cmv = (-Dimens.horizontalBlockSize * 60).obs;

  Future<void> changePosition() async {
    await Future.delayed(Duration(milliseconds: 200));
    cmv.value = Dimens.horizontalBlockSize * 0;
  }

  @override
  void initState() {
    super.initState();
    changePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          backgroundColor: AppColors.bg,
          body: Column(
            children: [
              _appBar(),
              _friendsList(),
              _toggleButton(),
              _makeFriend(),
            ],
          ),
        ),
        // _bottomNev(),
      ],
    );
  }

  Widget _makeFriend() {
    return Expanded(
      child: ListView.builder(
        controller: MainController.to.scrollViewController,
        padding: EdgeInsets.only(
          left: Dimens.s_15(),
          right: Dimens.s_15(),
          bottom: Dimens.verticalBlockSize * 10,
        ),
        itemCount: MainController.to.mKFM.length,
        shrinkWrap: true,
        itemBuilder: (c, i) {
          MakeFrdModel mf = MainController.to.mKFM[i];
          return Padding(
            padding: EdgeInsets.only(bottom: Dimens.verticalBlockSize * 2),
            child: Stack(
              alignment: Alignment.center,
              children: [
                EntryListItem(
                  index: i,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff4B164C),
                          Color(0xff4B164C).withAlpha(30),
                        ], // Start → End colors
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(mf.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: Dimens.verticalBlockSize * 40,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff4B164C).withAlpha(0),
                        Color(0xff4B164C).withAlpha(110),
                      ], // Start → End colors
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  height: Dimens.verticalBlockSize * 40,
                ),
                Obx(
                  () => AnimatedPositioned(
                    duration: Duration(milliseconds: 700),
                    right: cmv.value,
                    child: BlurryContainer(
                      blur: 15,
                      height: Dimens.verticalBlockSize * 18,
                      width: Dimens.horizontalBlockSize * 17,
                      elevation: 0,
                      color: Colors.white10,
                      padding: const EdgeInsets.all(8),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white54,
                            ),
                            height: Dimens.verticalBlockSize * 2,
                            width: 3,
                          ),
                          SizedBox(width: Dimens.horizontalBlockSize * 1.2),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(ImagesAsset.like, scale: 4),
                              SizedBox(height: Dimens.verticalBlockSize * 1.2),
                              Image.asset(ImagesAsset.comment, scale: 4),
                              SizedBox(height: Dimens.verticalBlockSize * 1.2),
                              Image.asset(ImagesAsset.more, scale: 4),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: EntryListItem(
                    index: i,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          border: Border.all(color: Color(0xffCACAD2)),
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimens.verticalBlockSize * 1.2,
                            horizontal: Dimens.s_15(),
                          ),
                          child: Text(
                            mf.hobby,
                            style: AppTextStyle.bodyRegular[14]?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: EntryListItem(
                    index: i,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: Dimens.s_15(),
                              right: Dimens.s_70(),
                            ),
                            child: Text(
                              mf.des,
                              style: AppTextStyle.bodyRegular[20]?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 1.1,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimens.s_15(),
                              vertical: Dimens.verticalBlockSize * 2,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(mf.profilePic),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mf.name,
                                      style: AppTextStyle.bodyRegular[14]
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            height: 1.5,
                                          ),
                                    ),
                                    Text(
                                      'STUTTGART',
                                      style: AppTextStyle.bodyRegular[10]
                                          ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            height: 1.1,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _toggleButton() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimens.s_15(),
        vertical: Dimens.verticalBlockSize * 4,
      ),
      height: Dimens.verticalBlockSize * 5.5,
      width: Dimens.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Color(0xffF8E7F6),
      ),
      child: Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: 700),
              alignment:
                  isAlignLeft.value
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                margin: EdgeInsets.symmetric(
                  horizontal: Dimens.horizontalBlockSize * 0.9,
                  vertical: Dimens.verticalBlockSize * 0.2,
                ),
                height: Dimens.verticalBlockSize * 4.5,
                width:
                    isAlignLeft.value
                        ? Dimens.horizontalBlockSize * 38
                        : Dimens.horizontalBlockSize * 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.s_28()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      isAlignLeft.value = true;
                    },
                    child: EntryListItem(
                      index: 0,
                      child: Container(
                        height: Dimens.verticalBlockSize * 5,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'Make Friends',
                          style: AppTextStyle.bodyRegular[14]?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isAlignLeft.value = false;
                    },
                    child: Container(
                      height: Dimens.verticalBlockSize * 5,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: EntryListItem(
                        index: 0,
                        child: Text(
                          'Search Partners',
                          style: AppTextStyle.bodyRegular[14]?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _friendsList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.s_15()),
        child: Row(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    EntryListItem(
                      index: 0,
                      child: CircleAvatar(
                        radius: Dimens.s_30(),
                        backgroundColor: AppColors.pink,
                        backgroundImage: AssetImage(ImagesAsset.p_1),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-1, 1),
                      child: Container(
                        height: Dimens.s_18(),
                        width: Dimens.s_18(),
                        decoration: BoxDecoration(
                          color: AppColors.pink,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.bg, width: 2),
                        ),
                        child: Image.asset(ImagesAsset.wAdd, scale: 4),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimens.verticalBlockSize * 1.2),
                EntryListItem(
                  index: 0,
                  child: Text(
                    'My Story',
                    style: AppTextStyle.bodyRegular[14]?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: Dimens.s_15()),
            Row(
              children: List.generate(MainController.to.friendsM.length, (i) {
                FriendsModel fm = MainController.to.friendsM[i];
                return Padding(
                  padding: EdgeInsets.only(right: Dimens.s_15()),
                  child: Column(
                    children: [
                      EntryListItem(
                        index: i,
                        child: CircleAvatar(
                          radius: Dimens.s_30(),
                          backgroundColor: AppColors.pink,
                          child: Container(
                            height: Dimens.s_55(),
                            width: Dimens.s_55(),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.bg, width: 3),
                              image: DecorationImage(
                                image: AssetImage(fm.img),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimens.verticalBlockSize * 1.2),
                      EntryListItem(
                        index: i,
                        child: Text(
                          fm.title,
                          style: AppTextStyle.bodyRegular[14]?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Friendzy',
                style: AppTextStyle.bodyRegular[20]?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              Container(
                height: Dimens.s_45(),
                width: Dimens.s_45(),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary.withAlpha(50)),
                ),
                child: Image.asset(ImagesAsset.notification, scale: 3.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
