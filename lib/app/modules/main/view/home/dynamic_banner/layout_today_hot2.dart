import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/modules/main/round_image.dart';
import 'package:tiki_clone/app/utils/const.dart';

class LayoutTodayHot2 extends StatelessWidget {
  final String title;
  final List<BannerData> listBanner;

  LayoutTodayHot2({this.title = "", this.listBanner});

  @override
  Widget build(BuildContext context) {
    BannerData bannerData1 = listBanner[0];
    BannerData bannerData2 = listBanner[1];
    BannerData bannerData3 = listBanner[2];
    BannerData bannerData4 = listBanner[3];
    BannerData bannerData5 = listBanner[4];
    return Container(
      width: double.infinity,
      height: 350,
      color: Colors.white,
      padding: EdgeInsets.all(AppDimens.appPaddingLeftRight),
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
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: RoundImage(
                      bannerData1.mobileUrl,
                      borderRadius: 8,
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: itemTodayHot2(bannerData2, bannerData4),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: itemTodayHot2(bannerData3, bannerData5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemTodayHot2(BannerData b1, BannerData b2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: RoundImage(
              b1.imageUrl,
              borderColor: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 1,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: RoundImage(
              b2.imageUrl,
              borderColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
