import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/utils/const.dart';

class LayoutReward1 extends StatelessWidget {
  final String title;
  final BannerData bannerData;

  LayoutReward1(this.title, this.bannerData);

  @override
  Widget build(BuildContext context) {
    if (bannerData == null) {
      return Container();
    }
    return Container(
      height: 100,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CachedNetworkImage(
              imageUrl: bannerData.mobileUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            left: AppDimens.appPaddingLeftRight,
            child: Text(
              title,
              style:
                  TextStyle(color: Colors.black, fontSize: AppDimens.defaultBigTextSize, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
