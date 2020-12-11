import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiki_clone/app/data/model/personalization_homepage_data.dart';
import 'package:tiki_clone/app/data/model/shock_price/product.dart';
import 'package:tiki_clone/app/utils/const.dart';

class FeatureSearchWidget extends StatelessWidget {
  final PersonalizationHomeData data;

  FeatureSearchWidget(this.data);

  @override
  Widget build(BuildContext context) {
    Product product1, product2, product3, product4;

    if (data == null || data.items == null) return Container();
    try {
      product1 = data.items[0];
      product2 = data.items[1];
      product3 = data.items[2];
      product4 = data.items[3];
    } on Exception {}

    return Container(
      height: 350,
      padding: EdgeInsets.all(AppDimens.appPaddingLeftRight),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                data.title,
                style:
                    TextStyle(color: Colors.black, fontSize: AppDimens.defaultBigTextSize, fontWeight: FontWeight.bold),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  data.refreshLinkText == null ? "" : data.refreshLinkText,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: AppDimens.defaultTextSize,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: contentView(product1, product2, Colors.cyan.withOpacity(0.3), Colors.amberAccent.withOpacity(0.3)),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child:
                contentView(product3, product4, Colors.pinkAccent.withOpacity(0.3), Colors.blueAccent.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }

  Widget contentView(Product product1, Product product2, Color color1, Color color2) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: itemView(product1, color1),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: itemView(product2, color2),
        ),
      ],
    );
  }

  Widget itemView(Product product, Color color) {
    if (product == null) return Container();
    if (product.thumbnailUrls == null) return Container();
    String thumb1 = "", thumb2 = "", thumb3 = "";
    try {
      List<String> listThumbs = product.thumbnailUrls;
      thumb1 = listThumbs[0];
      thumb2 = listThumbs[1];
      thumb3 = listThumbs[2];
    } on Exception {}
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                      imageUrl: thumb1,
                      errorWidget: (context, url, err) => Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                      imageUrl: thumb2,
                      errorWidget: (context, url, err) => Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                      imageUrl: thumb3,
                      errorWidget: (context, url, err) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: product.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black, fontSize: AppDimens.defaultTextSize),
                  ),
                  TextSpan(text: '\n'),
                  TextSpan(
                    text: product.subTitle,
                    style: TextStyle(color: Colors.grey, fontSize: AppDimens.defaultSmallTextSize),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
