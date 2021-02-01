class AppRemote {
  static const String baseUrl = "https://api.tiki.vn/";

  static const String pathHomeBanner = "v2/home/banners/v2";
  static const String pathShockPrice = "v2/widget/home/flash_deals";
  static const String pathHotBanner = "v2/widgets/banners/hot";
  static const String pathHomeBgBanner = "v2/widgets/config/home/banners";
  static const String pathShoppingQuickLink = "shopping/v2/widgets/quick_link";
  static const String pathDynamicBanner = "v2/widgets/dynamic_banners";
  static const String pathPersonalHomeData = "personalization/v2/homepage";
  static const String pathCategory = "/v2/categories";
  static const String pathCategoryBanner = "/v2/banners";
  static const String pathDealMixToday= "/v2/widget/deals/mix";
}

class AppRemoteParams {
  static const String paramsPlatform = "platform";
  static const String paramsAppVersion = "app_version";
  static const String paramsVersion = "version";
  static const String paramsPage = "page";
  static const String paramsPerPage = "per_page";
  static const String paramsParentId = "parent_id";
  static const String paramsGroup = "group";
  static const String paramsInclude = "include";
}
