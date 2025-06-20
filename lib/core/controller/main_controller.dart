import 'package:dating/core/constants/assets.dart';
import 'package:dating/core/model/friends_model.dart';
import 'package:dating/core/model/interest_model.dart';
import 'package:dating/core/model/make_frd_model.dart';
import 'package:dating/core/model/messages_model.dart';
import 'package:dating/core/model/people_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  late ScrollController scrollViewController;
  RxBool isScrollingDown = false.obs;
  @override
  void onInit() {
    super.onInit();
    scrollViewController = ScrollController();
    scrollViewController.addListener(() {
      if (scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown.value) {
          isScrollingDown.value = true;
        }
      }

      if (scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown.value) {
          isScrollingDown.value = false;
        }
      }
    });
  }

  RxInt selIn = 0.obs;

  RxDouble left = (4.4).obs;
  RxList<PeopleModel> matches =
      <PeopleModel>[
        PeopleModel(
          name: 'James',
          age: 20,
          location: 'HANOVER',
          distance: '1.3',
          isOnline: true,
          profile: ImagesAsset.dis3,
          matchPer: '100%',
        ),
        PeopleModel(
          name: 'Eddie',
          age: 23,
          location: 'dortmund',
          distance: '2',
          isOnline: true,
          profile: ImagesAsset.m1,
          matchPer: '94%',
        ),
        PeopleModel(
          name: 'Brandon',
          age: 20,
          location: 'Aplerbeck',
          distance: '2.5',
          profile: ImagesAsset.m2,
          matchPer: '89%',
        ),
        PeopleModel(
          name: 'Alfredo',
          age: 20,
          location: 'Essen',
          isOnline: true,
          distance: '2.5',
          profile: ImagesAsset.m3,
          matchPer: '80%',
        ),
        PeopleModel(
          name: 'Mateo',
          age: 20,
          location: 'Essen',
          isOnline: true,
          distance: '2.5',
          profile: ImagesAsset.m4,
          matchPer: '80%',
        ),
        PeopleModel(
          name: 'Alfredo',
          age: 20,
          location: 'Santino',
          isOnline: true,
          distance: '2.5',
          profile: ImagesAsset.m5,
          matchPer: '80%',
        ),
      ].obs;
  RxList<InterestModel> interest =
      [
        InterestModel(title: '⚽️Football'),
        InterestModel(title: '🍃Nature'),
        InterestModel(title: '🗣Language'),
        InterestModel(title: '📸Photography'),
        InterestModel(title: '🎵Music'),
        InterestModel(title: '✍️Writing'),
      ].obs;
  RxList<InterestModel> peoIn =
      [
        InterestModel(title: '🍃Nature'),
        InterestModel(title: '🏝Travel'),
        InterestModel(title: '✍️Writing'),
        InterestModel(title: '🙂People'),
      ].obs;
  RxList<String> iconList =
      [
        ImagesAsset.home,
        ImagesAsset.discover,
        ImagesAsset.add,
        ImagesAsset.frDs,
        ImagesAsset.chat,
      ].obs;
  RxList<String> selIconList =
      [
        ImagesAsset.wHome,
        ImagesAsset.wDiscover,
        ImagesAsset.add,
        ImagesAsset.wFrDs,
        ImagesAsset.wChat,
      ].obs;
  List<MakeFrdModel> mKFM = [
    MakeFrdModel(
      img: ImagesAsset.bc_1,
      profilePic: ImagesAsset.p_6,
      hobby: '🏝️Travel',
      name: 'Miranda Kehlani',
      des: 'If you could live anywhere in the world, where would you pick?',
    ),
    MakeFrdModel(
      img: ImagesAsset.bc_2,
      profilePic: ImagesAsset.p_5,
      name: 'George',
      hobby: '⚽️Football',
      des: 'If you could live anywhere in the world, where would you pick?',
    ),
  ];
  List<PeopleModel> discoverM = [
    PeopleModel(
      name: 'Halima',
      age: 19,
      location: 'BERLIN',
      distance: '16',
      isOnline: true,
      profile: ImagesAsset.dis1,
    ),
    PeopleModel(
      name: 'Vanessa',
      age: 18,
      location: 'MUNICH',
      distance: '4,8',
      profile: ImagesAsset.dis2,
    ),
    PeopleModel(
      name: 'James',
      age: 20,
      location: 'HANOVER',
      distance: '2,2',
      isOnline: true,
      profile: ImagesAsset.dis3,
    ),
    PeopleModel(
      name: 'Zara',
      age: 18,
      location: 'LONDON',
      distance: '8',
      profile: ImagesAsset.dis4,
    ),
  ];
  List<FriendsModel> friendsM = [
    FriendsModel(img: ImagesAsset.p_2, title: 'Selena'),
    FriendsModel(img: ImagesAsset.p_3, title: 'Clara'),
    FriendsModel(img: ImagesAsset.p_4, title: 'Fabian'),
    FriendsModel(img: ImagesAsset.p_5, title: 'George'),
    FriendsModel(img: ImagesAsset.p_6, title: 'Miranda'),
  ];
  RxList<String> sizes = ['S', 'M', 'L', 'XL'].obs;

  List<String> recentMatches = [
    ImagesAsset.dis3,
    ImagesAsset.m2,
    ImagesAsset.m3,
    ImagesAsset.m4,
    ImagesAsset.p_1,
    ImagesAsset.p_2,
    ImagesAsset.p_3,
  ];
  List<MessagesModel> chats = <MessagesModel>[
    MessagesModel(
      profile: ImagesAsset.m3,
      name: 'Alfredo Calzoni',
      dec: 'What about that new jacket if I ...',
      time: '09:18',
      isOnline: true,
    ),
    MessagesModel(
      profile: ImagesAsset.p_3,
      name: 'Clara Hazel',
      dec: 'I know right 😉',
      time: '12:44',
      isOnline: true,
    ),
    MessagesModel(
      profile: ImagesAsset.m2,
      name: 'Brandon Aminoff',
      dec: 'I’ve already registered, can’t wai...',
      time: '08:06',
      isOnline: true,
    ),
    MessagesModel(
      profile: ImagesAsset.p_2,
      name: 'Amina Mina',
      dec: 'It will have two lines of heading ...',
      time: '09:32',
      isOnline: false,
    ),
    MessagesModel(
      profile: ImagesAsset.dis2,
      name: 'Zara Khan',
      dec: 'Excited to share the new project update...',
      time: '08:45',
      isOnline: false,
    ),
    MessagesModel(
      profile: ImagesAsset.p_6,
      name: 'Noor Fatima',
      dec: 'Working on the final design today...',
      time: '07:58',
      isOnline: false,
    ),
    MessagesModel(
      profile: ImagesAsset.dis4,
      name: 'Sara Ali',
      dec: 'Meeting postponed to tomorrow morning.',
      time: '11:20',
      isOnline: false,
    ),
  ];
  RxInt selSize = 2.obs;
}
