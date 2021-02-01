import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/deal/deal_data.dart';
import 'package:tiki_clone/app/data/model/deal/time_data.dart';
import 'package:tiki_clone/app/modules/main/controllers/today_sock_deal_controller.dart';
import 'package:tiki_clone/app/modules/main/views/today_sock_deal/item_product_deal.dart';
import 'package:tiki_clone/app/modules/main/views/today_sock_deal/today_sockdeal_pined_header.dart';
import 'package:tiki_clone/app/utils/const.dart';
import 'package:tiki_clone/app/utils/logger.dart';
import 'package:tiki_clone/app/utils/utils.dart';

class TodaySockDealPage extends GetView<TodayDealController> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            pinned: true,
            titleSpacing: 0,
            floating: true,
            centerTitle: true,
            title: headerView()),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: 65,
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: listTime(),
              ),
            ],
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: TodaySockDealPinedHeader(),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            listDealProductWidget(),
          ]),
        )
      ],
    );
  }

  Widget headerView() {
    return Container(
      alignment: Alignment.center,
      height: 55,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.grey,
            ),
          ),
          titleHeader(),
          Icon(
            Icons.add_shopping_cart_rounded,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget titleHeader() {
    return Row(
      children: [
        SvgPicture.asset(
          AssetsImages.icShockPrice,
        ),
        SizedBox(
          width: 2,
        ),
        Image.asset(
          AssetsImages.icFlash,
          width: 20,
          height: 20,
        ),
        SizedBox(
          width: 2,
        ),
        SvgPicture.asset(
          AssetsImages.icToday,
        ),
      ],
    );
  }

  Widget listTime() {
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.horizontal,
        itemCount: controller.listTimeValue.length,
        itemBuilder: (context, index) {
          TimeValues timeValues = controller.listTimeValue[index];

          return GestureDetector(
            onTap: () {
              controller.setPosTimeSelected(index);
            },
            child: timeValues.active
                ? Obx(() => timeActiveWidget(
                    timeValues, controller.posTimeSelected == index))
                : Obx(() => timeInActiveWidget(
                    timeValues, controller.posTimeSelected == index)),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
      ),
    );
  }

  Widget timeInActiveWidget(TimeValues timeValues, bool isActive) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 2, color: isActive ? Colors.blue : Colors.transparent),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            timeValues.display,
            style: TextStyle(
                color: isActive ? Colors.blue : Colors.black,
                fontSize: AppDimens.defaultTextSize,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Sắp diễn ra",
            style: TextStyle(
                color: isActive ? Colors.blue : Colors.grey.withOpacity(0.8),
                fontSize: AppDimens.defaultSmallTextSize),
          ),
        ],
      ),
    );
  }

  Widget timeActiveWidget(TimeValues timeValues, bool isActive) {
    return Obx(() {
      int toDate = Utils.getTimesStamp(timeValues.toDate);
      int tmpTime = toDate - controller.currentTime;

      Duration duration = Duration(milliseconds: tmpTime);

      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      String twoDigitHour = twoDigits(duration.inHours.remainder(60));

      return Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 2, color: isActive ? Colors.blue : Colors.transparent),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Kết thúc sau",
              style: TextStyle(
                  color: isActive ? Colors.blueAccent : Colors.black,
                  fontSize: AppDimens.defaultTextSize),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                timeBoxWidget(twoDigitHour, isActive),
                SizedBox(
                  width: 3,
                ),
                timeBoxWidget(twoDigitMinutes, isActive),
                SizedBox(
                  width: 3,
                ),
                timeBoxWidget(twoDigitSeconds, isActive),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget timeBoxWidget(String value, bool isActive) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: isActive ? Colors.blueAccent : Colors.black,
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        value,
        style:
            TextStyle(color: Colors.white, fontSize: AppDimens.defaultTextSize),
      ),
    );
  }

  Widget listDealProductWidget() {
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: controller.listDealData.length,
        itemBuilder: (context, index) {
          DealData dealData = controller.listDealData[index];
          return Container(
            width: double.infinity,
            child: ItemProductDeal(dealData),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          );
        },
      ),
    );
  }
}
