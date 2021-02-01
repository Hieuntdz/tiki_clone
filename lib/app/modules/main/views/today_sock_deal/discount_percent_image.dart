import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tiki_clone/app/utils/const.dart';

class DiscountPercentImage extends StatelessWidget {
  final String thumbUrl;
  final int discountPercent;

  DiscountPercentImage(this.thumbUrl, this.discountPercent);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CachedNetworkImage(
              imageUrl: thumbUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, err) => Icon(Icons.error),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "$discountPercent %",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: AppDimens.defaultSmallTextSize),
              ),
            ),
          )
        ],
      ),
    );
  }
}
