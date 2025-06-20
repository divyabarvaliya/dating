import 'package:dating/core/controller/main_controller.dart';
import 'package:dating/core/model/messages_model.dart';
import 'package:dating/core/widgets/entry_list_item.dart';
import 'package:dating/screens/connect_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/constants.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Dimens.verticalBlockSize * 35),
            child: Image.asset(
              ImagesAsset.o,
              height: Dimens.verticalBlockSize * 18,
            ),
          ),
          Column(
            children: [_appBar(), _recentMatches(), Spacer(), _chatList()],
          ),
        ],
      ),
    );
  }

  Widget _chatList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.s_15()),
      height: Dimens.verticalBlockSize * 66,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: Dimens.verticalBlockSize * 1.3,
          bottom: Dimens.verticalBlockSize * 10,
        ),
        separatorBuilder: (c, sI) {
          return Container(
            height: 2,
            decoration: BoxDecoration(color: AppColors.darPurple.withAlpha(20)),
          );
        },
        itemCount: MainController.to.chats.length,
        itemBuilder: (c, i) {
          MessagesModel msgModel = MainController.to.chats[i];
          return GestureDetector(
            onTap: () {
              Get.to(
                () => ConnectScreen(
                  profile: msgModel.profile,
                  name: msgModel.name.split(' ')[0],
                ),
              );
            },
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimens.verticalBlockSize * 2,
                ),
                child: EntryListItem(
                  index: i,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(msgModel.profile),
                      ),
                      SizedBox(width: Dimens.s_8()),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              msgModel.name,
                              style: AppTextStyle.bodyRegular[18]?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.darPurple,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              msgModel.dec,
                              style: AppTextStyle.bodyRegular[14]?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.darPurple,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: AppColors.pink,
                          ),
                          SizedBox(height: Dimens.verticalBlockSize * 1.2),
                          Text(
                            msgModel.time,
                            style: AppTextStyle.bodyRegular[14]?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9EA3AE),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _recentMatches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Dimens.s_15()),
          child: Text(
            'Recent Matches',
            style: AppTextStyle.bodyRegular[16]?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: Dimens.verticalBlockSize * 2),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: Dimens.s_15()),
            child: Row(
              children: List.generate(MainController.to.recentMatches.length, (
                i,
              ) {
                String recentMat = MainController.to.recentMatches[i];
                return EntryListItem(
                  index: i,
                  child: Container(
                    margin: EdgeInsets.only(right: Dimens.s_20()),
                    height: Dimens.verticalBlockSize * 10,
                    width: Dimens.horizontalBlockSize * 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(recentMat),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child:
                        i == 0
                            ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.pink.withAlpha(140),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(ImagesAsset.heart, scale: 4),
                                    SizedBox(
                                      height: Dimens.verticalBlockSize * 1.2,
                                    ),
                                    Text(
                                      '32',
                                      style: AppTextStyle.bodyRegular[16]
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                            : SizedBox(),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _appBar() {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: Dimens.s_15()),
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
          Center(
            child: Text(
              'Messages',
              style: AppTextStyle.bodyRegular[24]?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
