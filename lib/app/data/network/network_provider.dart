import 'package:dio/dio.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/data/model/dynamic_banner_data.dart';
import 'package:tiki_clone/app/data/model/personalization_homepage_data.dart';
import 'package:tiki_clone/app/data/model/shock_price/shock_price_response.dart';
import 'package:tiki_clone/app/data/network/app_remote.dart';

class NetworkProvider {
  static const String appVersion = "4.62.1";
  static const String version = "4.62.1";

  Dio _createDio(String baseUrl) {
    BaseOptions options = new BaseOptions(
      baseUrl: '$baseUrl',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = new Dio(options);
    return dio;
  }

  Dio _dio;

  NetworkProvider() {
    _dio = _createDio(AppRemote.baseUrl);
  }

  Future<List<BannerData>> getListHomeBanner(String platform) async {
    Map<String, dynamic> parameters = new Map();
    parameters[AppRemoteParams.paramsPlatform] = platform;
    // parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    // parameters[AppRemoteParams.paramsVersion] = version;
    Response response = await _dio.get(AppRemote.pathHomeBanner, queryParameters: parameters);

    List<BannerData> listBanner = new List();

    if (response.statusCode == 200 && response.data != null && response.data['data'] != null) {
      response.data['data'].forEach((v) {
        listBanner.add(new BannerData.fromJson(v));
      });
    }

    return listBanner;
  }

  Future<List<BannerData>> getListHotBanner(String platform) async {
    Map<String, dynamic> parameters = new Map();
    parameters[AppRemoteParams.paramsPlatform] = platform;
    // parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    // parameters[AppRemoteParams.paramsVersion] = version;
    Response response = await _dio.get(AppRemote.pathHotBanner, queryParameters: parameters);

    List<BannerData> listBanner = new List();

    if (response.statusCode == 200 && response.data != null && response.data['data'] != null) {
      response.data['data'].forEach((v) {
        listBanner.add(new BannerData.fromJson(v));
      });
    }

    return listBanner;
  }

  Future<List<BannerData>> getShoppingQuickLink(String platform) async {
    Map<String, dynamic> parameters = new Map();
    parameters[AppRemoteParams.paramsPlatform] = platform;
    Response response = await _dio.get(AppRemote.pathShoppingQuickLink, queryParameters: parameters);

    List<BannerData> listBanner = new List();

    if (response.statusCode == 200 && response.data != null && response.data['data'] != null) {
      response.data['data'].forEach((v) {
        v.forEach((value) {
          listBanner.add(BannerData.fromJson(value));
        });
      });
    }

    return listBanner;
  }

  Future<List<BannerData>> getListHomeBgBanner(String platform) async {
    Map<String, dynamic> parameters = new Map();
    parameters[AppRemoteParams.paramsPlatform] = platform;
    // parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    // parameters[AppRemoteParams.paramsVersion] = version;
    Response response = await _dio.get(AppRemote.pathHomeBgBanner, queryParameters: parameters);

    List<BannerData> listBanner = new List();

    if (response.statusCode == 200 && response.data != null) {
      response.data.forEach((v) {
        listBanner.add(new BannerData.fromJson(v));
      });
    }
    return listBanner;
  }

  Future<ShockPriceResponse> getShockPriceResponse(String platform, int page, int perPage) async {
    Map<String, dynamic> parameters = new Map();
    parameters[AppRemoteParams.paramsPlatform] = platform;
    parameters[AppRemoteParams.paramsPage] = page;
    parameters[AppRemoteParams.paramsPerPage] = perPage;

    Response response = await _dio.get(AppRemote.pathShockPrice, queryParameters: parameters);

    if (response.statusCode == 200 && response.data != null) {
      ShockPriceResponse priceResponse = ShockPriceResponse.fromJson(response.data);
      return priceResponse;
    }
    return null;
  }

  Future<List<DynamicBannerData>> getListDynamicBanner(String platform) async {
    Map<String, dynamic> parameters = new Map();
    parameters[AppRemoteParams.paramsPlatform] = platform;
    // parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    // parameters[AppRemoteParams.paramsVersion] = version;
    Response response = await _dio.get(AppRemote.pathDynamicBanner, queryParameters: parameters);

    List<DynamicBannerData> listBanner = new List();

    if (response.statusCode == 200 && response.data != null) {
      response.data.forEach((v) {
        listBanner.add(new DynamicBannerData.fromJson(v));
      });
    }
    return listBanner;
  }

  Future<List<PersonalizationHomeData>> getListPersonalHomeData(String platform) async {
    Map<String, dynamic> parameters = new Map();
    parameters[AppRemoteParams.paramsPlatform] = platform;
    // parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    // parameters[AppRemoteParams.paramsVersion] = version;
    Response response = await _dio.get(AppRemote.pathPersonalHomeData, queryParameters: parameters);

    List<PersonalizationHomeData> listBanner = new List();

    if (response.statusCode == 200 && response.data != null && response.data['widgets'] != null) {
      response.data['widgets'].forEach((v) {
        listBanner.add(new PersonalizationHomeData.fromJson(v));
      });
    }
    return listBanner;
  }
}
