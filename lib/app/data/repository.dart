import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/data/model/category.dart';
import 'package:tiki_clone/app/data/model/deal/today_deal_response.dart';
import 'package:tiki_clone/app/data/model/dynamic_banner_data.dart';
import 'package:tiki_clone/app/data/model/personalization_homepage_data.dart';
import 'package:tiki_clone/app/data/network/network_provider.dart';

import 'model/shock_price/shock_price_response.dart';

class Repository {
  Repository._internal();

  static final Repository _repository = Repository._internal();
  NetworkProvider _networkProvider;

  factory Repository() {
    _repository._networkProvider = new NetworkProvider();
    return _repository;
  }

  Future<List<BannerData>> getListHomeBanner(String platform) async {
    return _networkProvider.getListHomeBanner(platform);
  }

  Future<List<BannerData>> getListHotBanner(String platform) async {
    return _networkProvider.getListHotBanner(platform);
  }

  Future<List<BannerData>> getListHomeBgBanner(String platform) async {
    return _networkProvider.getListHomeBgBanner(platform);
  }

  Future<ShockPriceResponse> getShockPriceResponse(String platform, int page, int perPage) async {
    return _networkProvider.getShockPriceResponse(platform, page, perPage);
  }

  Future<List<BannerData>> getShoppingQuickLinkResponse(String platform) async {
    return _networkProvider.getShoppingQuickLink(platform);
  }

  Future<List<DynamicBannerData>> getListDynamicBanner(String platform) async {
    return _networkProvider.getListDynamicBanner(platform);
  }

  Future<List<PersonalizationHomeData>> getListPersonalizationHomeData(String platform) async {
    return _networkProvider.getListPersonalHomeData(platform);
  }

  Future<List<Category>> getListCategory(String platform,{int parentID}) async {
    if(parentID == null){
      return _networkProvider.getListCategory(platform);
    }
    return _networkProvider.getListCategory(platform,parentId: parentID);
  }

  Future<List<BannerData>> getListCategoryBanner(String platform,int parentId) async {
    return _networkProvider.getListCategoryBanner(platform,parentId);
  }

  Future<TodayDealResponse> getTodayDealResponse(String platform) async {
    return _networkProvider.getTodayDealResponse(platform);
  }
}
