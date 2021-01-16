import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/category.dart';
import 'package:tiki_clone/app/modules/main/controllers/category_controller.dart';
import 'package:tiki_clone/app/modules/main/views/image_utils_widget.dart';
import 'package:tiki_clone/app/utils/const.dart';

import 'categoty_item_content.dart';

class CategoryContentWidget extends StatelessWidget {
  CategoryController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(CategoryController());

    return Container(
      child: Row(
        children: [
          categoryListWidget(),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey.withOpacity(0.2),
              padding: EdgeInsets.all(2),
              width: double.infinity,
              height: double.infinity,
              child: CategoryItemContent(),
            )
          ),
        ],
      ),
    );
  }

  Widget categoryListWidget() {
    return Container(
      width: 100,
      height: double.infinity,
      child: Obx(
        () => ListView.separated(
          itemCount: controller.listCategory.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            Category category = controller.listCategory[index];
            TextStyle textStyle = TextStyle(
                color: category.id == controller.currentCategoryId.value ? Colors.black : Colors.grey,
                fontWeight: category.id == controller.currentCategoryId.value ? FontWeight.bold : FontWeight.normal,
                fontSize: AppDimens.defaultTextSize);
            return InkWell(
              onTap: () {
                controller.setCurrentCategory(category);
              },
              child: Obx(
                () => Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 120,
                  color: category.id == controller.currentCategoryId.value
                      ? Colors.white
                      : Colors.blueGrey.withOpacity(0.3),
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 70,
                              child: ImageUtilsWidget(
                                url: category.thumbnailUrl,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                category.name ?? "",
                                style: textStyle,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Visibility(
                          visible: category.id == controller.currentCategoryId.value ? true : false,
                          child: Container(
                            width: 3,
                            height: double.infinity,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey.withOpacity(0.8),
            );
          },
        ),
      ),
    );
  }
}
