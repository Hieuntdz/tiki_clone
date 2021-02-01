import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiki_clone/app/data/model/deal/deal_data.dart';
import 'package:tiki_clone/app/data/model/shock_price/product.dart';
import 'package:tiki_clone/app/data/model/shock_price/progress.dart';
import 'package:tiki_clone/app/modules/main/views/home/progress_price_widget.dart';
import 'package:tiki_clone/app/modules/main/views/today_sock_deal/discount_percent_image.dart';
import 'package:tiki_clone/app/utils/const.dart';
import 'package:tiki_clone/app/utils/utils.dart';

class ItemProductDeal extends StatelessWidget {
  final DealData dealData;

  ItemProductDeal(this.dealData);

  @override
  Widget build(BuildContext context) {
    if (dealData == null || dealData.product == null) {
      return Container();
    }
    Product product = dealData.product;
    Progress progress = dealData.progress;
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      height: 150,
      child: Row(
        children: [
          Container(
            width: 150,
            height: double.infinity,
            child: DiscountPercentImage(
                product.thumbnailUrl, dealData.discountPercent),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black, fontSize: AppDimens.defaultTextSize),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${Utils.formatIntToNumber(dealData.specialPrice)} đ",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: AppDimens.defaultTextSize,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${Utils.formatIntToNumber(product.listPrice)} đ",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: AppDimens.defaultTextSize,
                      decoration: TextDecoration.lineThrough),
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                CustomPaint(
                  painter: ProgressPriceWidget(
                      percent: progress.percent / 100,
                      underColor: Colors.pinkAccent.withOpacity(0.8)),
                  child: Container(
                    width: 150,
                    height: 15,
                    alignment: Alignment.center,
                    child: Text(
                      progress.progressText,
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
          ),
        ],
      ),
    );
  }
}
