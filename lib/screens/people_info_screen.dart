import 'package:blurrycontainer/blurrycontainer.dart' show BlurryContainer;
import 'package:dating/core/controller/main_controller.dart';
import 'package:dating/core/model/people_model.dart';
import 'package:dating/core/widgets/entry_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

import '../core/constants/constants.dart';

class PeopleInfoScreen extends StatefulWidget {
  const PeopleInfoScreen({super.key, required this.peopleModel});
  final PeopleModel peopleModel;

  @override
  State<PeopleInfoScreen> createState() => _PeopleInfoScreenState();
}

class _PeopleInfoScreenState extends State<PeopleInfoScreen> {
  final PageController _pageController = PageController();
  RxInt _activePage = 0.obs;
  RxDouble per = (0.0).obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    per.value = double.parse(widget.peopleModel.matchPer!.split('%')[0]) / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SizedBox(
        height: Dimens.screenHeight,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: Dimens.verticalBlockSize * 65,
                    child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      controller: _pageController,
                      itemCount: 2,
                      onPageChanged: (int page) {
                        setState(() {
                          _activePage.value = page;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Hero(
                          tag: widget.peopleModel.profile,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(widget.peopleModel.profile),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff4B164C).withAlpha(0),
                                    Color(0xff4B164C),
                                  ],
                                  // Start → End colors
                                  begin: Alignment(0.0, -0.5),
                                  end: Alignment(0.0, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: Dimens.verticalBlockSize * 7,
                  left: Dimens.s_15(),
                  right: Dimens.s_15(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: Dimens.s_45(),
                          width: Dimens.s_45(),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white70),
                          ),
                          child: Image.asset(
                            ImagesAsset.backIc,
                            scale: 3.6,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54, width: 2),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: BlurryContainer(
                            blur: 15,
                            elevation: 0,
                            color: Colors.white10,
                            padding: const EdgeInsets.symmetric(
                              vertical: 13,
                              horizontal: 12,
                            ),
                            borderRadius: BorderRadius.circular(32),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImagesAsset.send,
                                  scale: 3.6,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '${widget.peopleModel.distance} Km',
                                  style: AppTextStyle.bodyRegular[16]?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: Dimens.verticalBlockSize * 47,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${widget.peopleModel.name}, ${widget.peopleModel.age}',
                              style: AppTextStyle.bodyRegular[30]?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            if (widget.peopleModel.isOnline) SizedBox(width: 8),
                            if (widget.peopleModel.isOnline)
                              CircleAvatar(
                                backgroundColor: AppColors.lightGreen,
                                radius: 7,
                              ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimens.verticalBlockSize * 1.5,
                          ),
                          child: Text(
                            widget.peopleModel.location,
                            style: AppTextStyle.bodyRegular[14]?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 4,
                            bottom: 4,
                            left: 4,
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: AppColors.primary,
                            border: Border.all(
                              color: AppColors.pink,
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => CircularPercentIndicator(
                                  radius: 25.0,
                                  lineWidth: 5.5,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  percent: per.value,
                                  center: Text(
                                    '${(per.value * 100).toInt()}%', // Converts to percentage
                                    style: AppTextStyle.bodyRegular[12]
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                  ),
                                  backgroundColor: Color(0xff773873),
                                  progressColor: AppColors.pink,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Match', // Converts to percentage
                                style: AppTextStyle.bodyRegular[20]?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: Dimens.s_15(),
                  top: Dimens.verticalBlockSize * 25,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: List.generate(2, (i) {
                        return Container(
                          height: Dimens.verticalBlockSize * 4.5,
                          width: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                _activePage.value == i
                                    ? Colors.white
                                    : Colors.transparent,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            EntryListItem(
              index: 0,
              child: DraggableScrollableSheet(
                initialChildSize: 0.45,
                minChildSize: 0.45,
                maxChildSize: 0.6,
                builder: (context, scrollController) {
                  scrollController.addListener(() {
                    debugPrint(
                      "Scroll position: ${scrollController.position.pixels}",
                    ); // You can also access extent or other values
                  });
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: Dimens.verticalBlockSize * 1.5,
                            ),
                            height: 5,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColors.greyScale[20],
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Dimens.s_15(),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: Dimens.verticalBlockSize * 2,
                                        ),
                                        child: Text(
                                          'About',
                                          style: AppTextStyle.bodyRegular[16]
                                              ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primary,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: Dimens.verticalBlockSize * 1.5,
                                          bottom: Dimens.verticalBlockSize * 2,
                                        ),
                                        child: Text(
                                          'A good listener. I love having a good talk to know each other’s side 😍.',
                                          style: AppTextStyle.bodyRegular[16]
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.primary,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimens.verticalBlockSize * 2,
                                      ),
                                      Text(
                                        'Interest',
                                        style: AppTextStyle.bodyRegular[16]
                                            ?.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primary,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: Dimens.verticalBlockSize * 2,
                                          bottom: Dimens.verticalBlockSize * 20,
                                        ),
                                        child: Wrap(
                                          spacing:
                                              Dimens.s_8(), // gap between adjacent chips
                                          runSpacing:
                                              Dimens.verticalBlockSize *
                                              1.5, // gap between lines
                                          children:
                                              MainController.to.peoIn.map((
                                                interest,
                                              ) {
                                                return EntryListItem(
                                                  index: MainController.to.peoIn
                                                      .indexOf(interest),
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                      vertical:
                                                          Dimens
                                                              .verticalBlockSize *
                                                          1.2,
                                                      horizontal: Dimens.s_10(),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: AppColors.primary
                                                            .withAlpha(70),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            32,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      interest.title,
                                                      style: AppTextStyle
                                                          .bodyRegular[16]
                                                          ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                AppColors
                                                                    .primary,
                                                          ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimens.verticalBlockSize * 5),
              child: EntryListItem(
                index: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withAlpha(20), // Shadow color
                        spreadRadius: 6, // How much it spreads
                        blurRadius: 10, // How soft the shadow is
                        offset: Offset(2, 2), // Horizontal and vertical offset
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _optionCircle(
                        ic: ImagesAsset.close,
                        bgColor: Colors.white,
                      ),
                      SizedBox(width: 30),
                      _optionCircle(
                        ic: ImagesAsset.fev,
                        bgColor: AppColors.primary,
                      ),
                      SizedBox(width: 30),
                      _optionCircle(
                        ic: ImagesAsset.heart,
                        bgColor: AppColors.pink,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionCircle({required Color bgColor, required String ic}) {
    return Container(
      height: Dimens.s_55(),
      width: Dimens.s_55(),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(20), // Shadow color
            spreadRadius: 6, // How much it spreads
            blurRadius: 10, // How soft the shadow is
            offset: Offset(2, 2), // Horizontal and vertical offset
          ),
        ],
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: Image.asset(ic, scale: 3.8),
    );
  }
}
