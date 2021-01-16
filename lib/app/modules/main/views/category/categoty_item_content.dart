import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/data/model/category.dart';
import 'package:tiki_clone/app/data/model/category_children.dart';
import 'package:tiki_clone/app/modules/main/controllers/category_controller.dart';
import 'package:tiki_clone/app/modules/main/views/category/item_banner.dart';
import 'package:tiki_clone/app/modules/main/views/image_utils_widget.dart';
import 'package:tiki_clone/app/utils/const.dart';
import 'package:tiki_clone/app/utils/logger.dart';

class CategoryItemContent extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () => controller.currentCategory == null
                ? Container()
                : Container(
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.currentCategory.value.name ?? "",
                          style: TextStyle(
                              fontSize: AppDimens.defaultBigTextSize,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                            size: 20,
                          ),
                        )
                      ],
                    )),
          ),
          SizedBox(
            height: 5,
          ),
          _bannerContent(),
          SizedBox(
            height: 10,
          ),
          _listItemWidget(),
        ],
      ),
    );
  }

  Widget _bannerContent() {
    return Obx(
      () => controller.listCategoryBanner.length == 0
          ? Container()
          : Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller.bannerCategoryController,
                    itemCount: controller.listCategoryBanner.length,
                    onPageChanged: (int page) =>
                        controller.onBannerPageViewChange(page),
                    itemBuilder: (context, index) {
                      BannerData banner = controller.listCategoryBanner[index];
                      return ItemBanner(banner);
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 5,
                    child: LayoutBuilder(
                      builder: (context, constrains) {
                        Logger.debug("Constrains $constrains");
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.listCategoryBanner.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            double itemWidth = constrains.maxWidth /
                                controller.listCategoryBanner.length;
                            return Obx(
                              () => Container(
                                margin: EdgeInsets.only(left: 2, right: 2),
                                width: itemWidth,
                                height: 3,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: index ==
                                            controller.currentBannerIndex.value
                                        ? Colors.white
                                        : Colors.transparent),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _listItemWidget() {
    return Obx(
      () => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.listChildrenCategory.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 5,
          );
        },
        itemBuilder: (context, index) {
          Category category = controller.listChildrenCategory[index];
          return Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              children: [
                _childrenHeaderWidget(category),
                SizedBox(
                  height: 5,
                ),
                _childrenListItemWidget(category.children),
              ],
            ),
          );
        },
      ),
    );
  }

  _childrenHeaderWidget(Category category) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category.name ?? "",
          style: TextStyle(
              color: Colors.black,
              fontSize: AppDimens.defaultTextSize,
              fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            "Tất cả",
            style: TextStyle(
                color: Colors.blue,
                fontSize: AppDimens.defaultBigTextSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  _childrenListItemWidget(List<CategoryChildren> children) {
    if (children == null) {
      return Container();
    }
    return GridView.builder(
      itemCount: children.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          childAspectRatio: 2 / 3),
      itemBuilder: (context, index) {
        CategoryChildren item = children[index];
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageUtilsWidget(
                url: item.thumbnailUrl,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                item.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
