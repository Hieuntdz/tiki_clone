import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/data/model/category.dart';
import 'package:tiki_clone/app/data/repository.dart';
import 'package:tiki_clone/app/utils/logger.dart';
import 'package:tiki_clone/app/utils/utils.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();

  PageController bannerCategoryController = new PageController();

  Repository _repository = Repository();

  var listCategory = [].obs;
  var listCategoryBanner = [].obs;
  var currentCategoryId = 0.obs;
  var currentCategory = new Category().obs;
  var listChildrenCategory = [].obs;

  @override
  void onInit() {
    super.onInit();
    print("CategoryController init");
    _getListCategory();
  }

  @override
  void onReady() {
    super.onReady();
    print("CategoryController onReady");
  }

  @override
  void onClose() {
    super.onClose();
  }

  /*
    *handle scroll banner
   */

  var currentBannerIndex = 0.obs;
  Timer _timer;
  int delayNextBanner = 5;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  onBannerPageViewChange(int page) {
    Logger.info("start");
    Logger.debug("page $page");
    resetTimerBanner();
    setCurrentPage(page);
  }

  void resetTimerBanner() {
    if (_timer == null) {
      return;
    }
    _timer.cancel();
    _timer =
        Timer.periodic(Duration(seconds: delayNextBanner), timerBannerCallback);
  }

  void setCurrentPage(int index) {
    this.currentBannerIndex.value = index;
  }

  void timerBannerCallback(Timer timer) {
    nextBanner();
    if (currentBannerIndex.value != 0 && bannerCategoryController.hasClients) {
      bannerCategoryController.animateToPage(
        currentBannerIndex.value,
        duration: _kDuration,
        curve: _kCurve,
      );
    } else {
      if (bannerCategoryController.hasClients) {
        bannerCategoryController.jumpToPage(currentBannerIndex.value);
      }
    }
  }

  void nextBanner() {
    if (currentBannerIndex.value >= listCategoryBanner.length - 1) {
      currentBannerIndex.value = 0;
    } else {
      currentBannerIndex.value++;
    }
  }

  /*
    *GetListCategory
   */
  Future<void> _getListCategory() async {
    Logger.info("start");
    listCategory.clear();
    List<Category> mList = await _repository.getListCategory(Utils.getPlatform);
    listCategory.addAll(mList);
    Logger.debug("_getListCategory SIZE ${mList.length}");

    if (listCategory.length > 0) {
      Category current = listCategory[0];

      setCurrentCategory(current);
    }
  }

  void setCurrentCategory(Category category) {
    currentCategoryId.value = category.id;
    currentCategory.value = category;
    currentBannerIndex.value = 0;
    _getListCategoryBanner(category.id);
    _getListChildrenCategory(category.id);

  }

  Future<void> _getListCategoryBanner(int parentId) async {
    Logger.info("begin");
    listCategoryBanner.clear();
    List<BannerData> mList =
        await _repository.getListCategoryBanner(Utils.getPlatform, parentId);
    listCategoryBanner.addAll(mList);
    Logger.debug("_getListCategoryBanner SIZE ${mList.length}");

    //Auto next banner
    if (_timer != null) {
      _timer.cancel();
    }
    _timer =
        Timer.periodic(Duration(seconds: delayNextBanner), timerBannerCallback);
  }

  /*
    *Children categoty
   */

  Future<void> _getListChildrenCategory(int parentId) async {
    Logger.info("start");
    Logger.debug("_getListChildrenCategory parentId $parentId");
    listChildrenCategory.clear();
    List<Category> mList = await _repository.getListCategory(Utils.getPlatform,parentID : parentId);
    listChildrenCategory.addAll(mList);
    Logger.debug("_getListChildrenCategory SIZE ${mList.length}");
  }

}
