import 'package:flutter/widgets.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/modules/main/views/image_utils_widget.dart';

class ItemBanner extends StatelessWidget{
  BannerData _bannerData;

  ItemBanner(this._bannerData);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: ImageUtilsWidget(
          fit: BoxFit.fill,
          url: _bannerData.mobileUrl == null ? "" : _bannerData.mobileUrl,
        ),
      ),
    );
  }


}