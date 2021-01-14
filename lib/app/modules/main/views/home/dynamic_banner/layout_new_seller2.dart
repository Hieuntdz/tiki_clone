import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/modules/main/round_image.dart';
import 'package:tiki_clone/app/utils/const.dart';

class LayoutNewSeller2 extends StatelessWidget {
  final String title;
  final List<BannerData> listBannerData;

  LayoutNewSeller2({this.title, this.listBannerData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.appPaddingLeftRight),
      height: 350,
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
            child: ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: listBannerData.length,
              itemBuilder: (context, index) {
                BannerData banner = listBannerData[index];
                return Container(
                  height: double.infinity,
                  width: 170,
                  alignment: Alignment.center,
                  child: RoundImage(
                    banner.mobileUrl,
                    borderColor: Colors.grey,
                    boxFit: BoxFit.cover,
                  ),
                );
              },
              separatorBuilder: (context, index) => Container(
                width: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
