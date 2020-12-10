import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/data/model/dynamic_banner_data.dart';
import 'package:tiki_clone/app/data/model/shock_price/shock_price_response.dart';
import 'package:tiki_clone/app/data/repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Repository _repository = Repository();

  ScrollController scrollController = new ScrollController();
  PageController bannerPageController = new PageController();

  final double appBarResize = 60.0;

  var logoOpacity = 1.0.obs;
  var marginRightSearchBar = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(appBarScrollListener);

    _initData();
  }

  _initData() {
    _getListBanner();
    _getListShockPrice(1, 10);
    _getListHotBanner();
    _getListHomeBgBanner();
    _getListShoppingQuickLink();
    _getListDynamicBanner();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /*Handle AppBar scroll*/
  appBarScrollListener() {
    print("scrollListener offsets ${scrollController.offset}");
    // print("scrollListener position.maxScrollExtent  ${scrollController.position.maxScrollExtent}");
    // print("scrollListener position.minScrollExtent  ${scrollController.position.minScrollExtent}");

    double tmpOpacity = 1 - 0.02 * scrollController.offset;
    logoOpacity.value = tmpOpacity < 0 ? 0 : tmpOpacity;

    if (scrollController.offset >= 20) {
      print("scrollListener change to 50 ");
      marginRightSearchBar.value = appBarResize;
    } else if (scrollController.offset <= 20) {
      print("scrollListener change to 0 ");
      marginRightSearchBar.value = 0;
    }
  }

  /*Banner*/

  var listHomeBanner = new List().obs;

  Future<void> _getListBanner() async {
    listHomeBanner.clear();
    List<BannerData> homBanner = await _repository.getListHomeBanner(GetPlatform.isAndroid ? "android" : "ios");
    listHomeBanner.addAll(homBanner);

    print("getListBanner List size ${listHomeBanner.length}");

    //Auto next banner
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: delayNextBanner), timerBannerCallback);
  }

  var currentBannerIndex = 0.obs;

  void setCurrentPage(int index) {
    this.currentBannerIndex.value = index;
  }

  void nextBanner() {
    if (currentBannerIndex.value >= listHomeBanner.length - 1) {
      currentBannerIndex.value = 0;
    } else {
      currentBannerIndex.value++;
    }
  }

  // Banner Logic
  final pageController = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  static int delayNextBanner = 5;
  Timer _timer;

  void timerBannerCallback(Timer timer) {
    nextBanner();
    if (currentBannerIndex.value != 0) {
      bannerPageController.animateToPage(
        currentBannerIndex.value,
        duration: _kDuration,
        curve: _kCurve,
      );
    } else {
      bannerPageController.jumpToPage(currentBannerIndex.value);
    }
  }

  void resetTimerBanner() {
    if (_timer == null) {
      return;
    }
    _timer.cancel();
    _timer = Timer.periodic(Duration(seconds: delayNextBanner), timerBannerCallback);
  }

  void onBannerSelected(int page) {
    resetTimerBanner();
    setCurrentPage(page);
    bannerPageController.animateToPage(
      page,
      duration: _kDuration,
      curve: _kCurve,
    );
  }

  /*Shock Price*/
  var shockPriceResponse = new ShockPriceResponse().obs;
  var listShockPriceData = new List().obs;

  Future<void> _getListShockPrice(int page, int perPage) async {
    ShockPriceResponse priceResponse =
        await _repository.getShockPriceResponse(GetPlatform.isAndroid ? "android" : "ios", page, perPage);
    if (priceResponse == null) {
      return;
    }

    listShockPriceData.addAll(priceResponse.data);

    shockPriceResponse.update((value) {
      value.data = priceResponse.data;
      value.filters = priceResponse.filters;
      value.paging = priceResponse.paging;
    });
  }

  /*Hot banner*/
  var listHotBanner = new List().obs;

  Future<void> _getListHotBanner() async {
    listHotBanner.clear();
    List<BannerData> bannerData = await _repository.getListHotBanner(GetPlatform.isAndroid ? "android" : "ios");
    listHotBanner.addAll(bannerData);
    print("_getListHotBanner List size ${listHotBanner.length}");
  }

  /*Home Bg banner*/
  var listHomeBgBanner = new List().obs;

  Future<void> _getListHomeBgBanner() async {
    listHomeBgBanner.clear();
    List<BannerData> bannerData = await _repository.getListHomeBgBanner(GetPlatform.isAndroid ? "android" : "ios");
    listHomeBgBanner.addAll(bannerData);
    print("_getListHomeBgBanner List size ${listHomeBgBanner.length}");
  }

  /*Home Shopping Quick link */
  var listShoppingQuickLink = new List().obs;
  Future<void> _getListShoppingQuickLink() async {
    listShoppingQuickLink.clear();
    List<BannerData> bannerData =
        await _repository.getShoppingQuickLinkResponse(GetPlatform.isAndroid ? "android" : "ios");
    listShoppingQuickLink.addAll(bannerData);
    print("_getListShoppingQuickLink List size ${listShoppingQuickLink.length}");
  }

  /*Dynamic Banner */
  var listDynamicBanner = new List().obs;
  Future<void> _getListDynamicBanner() async {
    listDynamicBanner.clear();
    List<DynamicBannerData> bannerData =
        await _repository.getListDynamicBanner(GetPlatform.isAndroid ? "android" : "ios");
    listDynamicBanner.addAll(bannerData);
    print("_getListDynamicBanner List size ${listShoppingQuickLink.length}");
  }
}
