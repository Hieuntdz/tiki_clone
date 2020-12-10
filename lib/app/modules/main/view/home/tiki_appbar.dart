import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/modules/main/controllers/home_controller.dart';
import 'package:tiki_clone/app/utils/const.dart';

class TikiAppbar extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      titleSpacing: 0,
      floating: true,
      actions: [
        Icon(
          Icons.message,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(
          width: AppDimens.appPaddingLeftRight,
        ),
      ],
      centerTitle: true,
      title: Obx(
        () => Opacity(
          opacity: controller.logoOpacity.value,
          child: SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(
              "assets/images/logo.png",
              width: 30,
              height: 30,
            ),
          ),
        ),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var top = constraints.biggest.height;
          double size = min(
              // bc.constrainHeight() - MediaQuery.of(context).padding.top,
              constraints.constrainHeight(),
              120);
          print('constraints=' + constraints.toString());
          print('constraints MAX =' + top.toString());
          return FlexibleSpaceBar.createSettings(
            currentExtent: 0,
            minExtent: 0,
            maxExtent: 100,
            child: FlexibleSpaceBar(
              centerTitle: true,
              stretchModes: [],
              title: Row(
                children: [
                  Container(
                    color: Colors.transparent,
                    height: 35,
                    width: AppDimens.appPaddingLeftRight,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      child: TextFormField(
                        style: TextStyle(fontSize: 14),
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(
                              left: AppDimens.appPaddingLeftRight, right: AppDimens.appPaddingLeftRight),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          hintText: 'Nhập tên sản phẩm ...',
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      color: Colors.transparent,
                      height: 35,
                      width: controller.marginRightSearchBar.value,
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 35,
                    width: AppDimens.appPaddingLeftRight,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      expandedHeight: 100,
      backgroundColor: Colors.blueAccent,
    );
  }
}
