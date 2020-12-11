import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tiki_clone/app/data/model/shock_price/shock_price_data.dart';
import 'package:tiki_clone/app/modules/main/controllers/home_controller.dart';
import 'package:tiki_clone/app/modules/main/view/home/progress_price_widget.dart';
import 'package:tiki_clone/app/utils/const.dart';
import 'package:tiki_clone/app/utils/utils.dart';

class ShockPriceWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: AppDimens.appPaddingLeftRight, right: AppDimens.appPaddingLeftRight),
      height: 170,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          Row(
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
              Expanded(
                flex: 1,
                child: Container(),
              ),
              timeRemain(),
              InkWell(
                child: Icon(
                  Icons.navigate_next,
                  size: 16,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: listShockItem(),
          ),
        ],
      ),
    );
  }

  Widget timeRemain() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          timeText("06"),
          Text(":", style: TextStyle(color: Colors.black, fontSize: AppDimens.defaultSmallTextSize)),
          timeText("05"),
          Text(":", style: TextStyle(color: Colors.black, fontSize: AppDimens.defaultSmallTextSize)),
          timeText("16"),
          Text(":", style: TextStyle(color: Colors.black, fontSize: AppDimens.defaultSmallTextSize))
        ],
      ),
    );
  }

  Widget timeText(String value) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child: Text(
        value,
        style: TextStyle(color: Colors.white, fontSize: AppDimens.defaultSmallTextSize),
      ),
    );
  }

  Widget listShockItem() {
    return Obx(
      () => ListView.separated(
        itemCount: controller.listShockPriceData.length > 0 ? controller.listShockPriceData.length + 1 : 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == controller.listShockPriceData.length)
            return SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.navigate_next,
                    color: Colors.indigo,
                    size: 30,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Xem thêm",
                    style: TextStyle(color: Colors.indigo, fontSize: AppDimens.defaultTextSize),
                  )
                ],
              ),
            );
          ShockPriceData priceData = controller.listShockPriceData[index];
          return itemShockPriceData(priceData);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 15,
          );
        },
      ),
    );
  }

  Widget itemShockPriceData(ShockPriceData priceData) {
    String price = Utils.formatIntToNumber(priceData.product.price) + " đ";
    int discount = (priceData.product.discount / (priceData.product.discount + priceData.product.price) * 100).round();
    return Container(
      width: 80,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 60,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: 80,
                    width: 60,
                    color: Colors.grey,
                    child: CachedNetworkImage(
                      imageUrl: priceData.product.thumbnailUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomRight: Radius.circular(20)),
                  ),
                  child: Text(
                    "-$discount%",
                    style: TextStyle(fontSize: AppDimens.defaultSmallTextSize, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            price,
            style: TextStyle(color: Colors.black, fontSize: AppDimens.defaultTextSize),
          ),
          SizedBox(
            height: 5,
          ),
          CustomPaint(
            painter: ProgressPriceWidget(
                percent: (priceData.progress.orderedPercent / 100), underColor: Colors.pinkAccent.withOpacity(0.8)),
            child: Container(
              width: 60,
              height: 15,
              alignment: Alignment.center,
              child: Text(
                priceData.progress.progressText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimens.defaultSmallTextSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
