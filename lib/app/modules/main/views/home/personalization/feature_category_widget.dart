import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiki_clone/app/data/model/personalization_homepage_data.dart';
import 'package:tiki_clone/app/data/model/shock_price/product.dart';
import 'package:tiki_clone/app/modules/main/round_image.dart';
import 'package:tiki_clone/app/utils/const.dart';

class FeatureCategoryWidget extends StatelessWidget {
  final PersonalizationHomeData data;

  FeatureCategoryWidget(this.data);

  @override
  Widget build(BuildContext context) {
    if (data == null) return Container();
    return Container(
      height: 250,
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
                  data.moreLinkText,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: AppDimens.defaultTextSize,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: data.items == null
                ? Container()
                : GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: data.items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      Product product = data.items[index];
                      return Container(
                        width: 50,
                        height: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: RoundImage(product.thumbnailUrl),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              product.name,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppDimens.defaultTextSize,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
