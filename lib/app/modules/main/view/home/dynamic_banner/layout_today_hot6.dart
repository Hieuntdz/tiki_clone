import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/modules/main/round_image.dart';
import 'package:tiki_clone/app/utils/const.dart';

class LayoutTodayHot6 extends StatelessWidget {
  final String title;
  final List<BannerData> listBanner;

  LayoutTodayHot6({this.title = "", this.listBanner});

  @override
  Widget build(BuildContext context) {
    BannerData bannerData1 = listBanner[0];
    BannerData bannerData2 = listBanner[1];
    BannerData bannerData3 = listBanner[2];
    BannerData bannerData4 = listBanner[3];
    BannerData bannerData5 = listBanner[4];
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(AppDimens.appPaddingLeftRight),
      height: Get.width,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              title,
              style:
                  TextStyle(color: Colors.black, fontSize: AppDimens.defaultBigTextSize, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: RoundImage(
                    bannerData1.imageUrl,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: RoundImage(
                    bannerData2.imageUrl,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: RoundImage(
                    bannerData3.imageUrl,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: RoundImage(
                    bannerData4.imageUrl,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: RoundImage(
                    bannerData5.imageUrl,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
