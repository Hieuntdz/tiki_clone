import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/shock_price/product.dart';
import 'package:tiki_clone/app/modules/main/view/image_utils_widget.dart';
import 'package:tiki_clone/app/modules/main/view/star_rating.dart';
import 'package:tiki_clone/app/utils/const.dart';
import 'package:tiki_clone/app/utils/utils.dart';

class ContentTabWidget extends StatelessWidget {
  final List<Product> listProduct;

  ContentTabWidget(this.listProduct);

  @override
  Widget build(BuildContext context) {
    if (listProduct == null) return Container();
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2 / 3),
        itemCount: listProduct.length,
        itemBuilder: (context, index) {
          Product product = listProduct[index];
          return itemProduct(product);
        },
      ),
    );
  }

  Widget itemProduct(Product product) {
    if (product == null) return Container();
    return GridTile(
      child: Container(
        padding: EdgeInsets.all(10),
        width: Get.width / 2,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.3)),
        child: Column(
          children: [
            Container(
              child: ImageUtilsWidget(
                url: product.thumbnailUrl,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              child: Text(
                product.name ?? "",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: AppDimens.defaultTextSize),
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                StarRating(
                  rating: product.ratingAverage,
                  color: Colors.orange,
                ),
                Text(
                  "(${product.reviewCount})",
                  style: TextStyle(color: Colors.grey, fontSize: AppDimens.defaultSmallTextSize),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: Utils.formatIntToNumber(product.price),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: AppDimens.defaultTextSize),
                    ),
                    TextSpan(text: " "),
                    TextSpan(
                      text: "đ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontSize: AppDimens.defaultTextSize),
                    )
                  ]),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(2),
                  child: Text(
                    "${product.discountRate} %",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimens.defaultTextSize,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
