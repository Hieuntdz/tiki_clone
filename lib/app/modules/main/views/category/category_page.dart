import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/modules/main/controllers/category_controller.dart';
import 'package:tiki_clone/app/utils/const.dart';

import 'category_content_widget.dart';

class CategoryPage extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    print("CategoryPage build");
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          height: 35,
          child: TextFormField(
            readOnly: true,
            style: TextStyle(fontSize: 14),
            keyboardType: TextInputType.text,
            decoration: new InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.only(left: AppDimens.appPaddingLeftRight, right: AppDimens.appPaddingLeftRight),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              hintText: 'Sản phẩm, thương hiệu và mọi thứ bạn cần...',
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
        actions: [
          Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: AppDimens.appPaddingLeftRight,
          ),
        ],
      ),
      body: Center(
        child: CategoryContentWidget(),
      ),
    );
  }
}
