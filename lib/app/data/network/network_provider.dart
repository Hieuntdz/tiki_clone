import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/data/model/category.dart';
import 'package:tiki_clone/app/data/model/dynamic_banner_data.dart';
import 'package:tiki_clone/app/data/model/personalization_homepage_data.dart';
import 'package:tiki_clone/app/data/model/shock_price/shock_price_response.dart';
import 'package:tiki_clone/app/data/network/app_remote.dart';
import 'package:tiki_clone/app/data/network/dio_client.dart';

class NetworkProvider {
  static const String appVersion = "4.62.1";
  static const String version = "4.62.1";

  DioClient _dioClient;

  NetworkProvider() {
    _dioClient = DioClient.getDioClient;
    _dioClient.createDio(AppRemote.baseUrl);
  }

  void handleDioException(error) {
    print("handleDioException");
    if (!(error is Exception)) {
      if (error.toString().contains("is not a subtype of")) {
        //unableToProcess
      } else {
        //unexpectedError
      }
      return;
    }

    try {
      if (error is DioError) {
        if (error.error is SocketException) {
          //networkExceptions
          print("handleDioException networkExceptions");
          return;
        }
        switch (error.type) {
          case DioErrorType.CANCEL:
            break;
          case DioErrorType.CONNECT_TIMEOUT:
            break;
          case DioErrorType.DEFAULT:
            break;
          case DioErrorType.RECEIVE_TIMEOUT:
            break;
          case DioErrorType.RESPONSE:
            break;
          case DioErrorType.SEND_TIMEOUT:
            break;
        }
      }
    } on FormatException catch (e) {
      // formatException
    } catch (_) {
      // unexpectedError
    }
  }

  Future<List<BannerData>> getListHomeBanner(String platform) async {
    Map<String, dynamic> parameters = new Map();
    parameters[AppRemoteParams.paramsPlatform] = platform;
    parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    parameters[AppRemoteParams.paramsVersion] = version;
    Response response = await _dioClient.get(AppRemote.pathHomeBanner, queryParameters: parameters);

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
    parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    parameters[AppRemoteParams.paramsVersion] = version;

    List<BannerData> listBanner = new List();
    try {
      Response response = await _dioClient.get(AppRemote.pathHotBanner, queryParameters: parameters);
      if (response.statusCode == 200 && response.data != null && response.data['data'] != null) {
        response.data['data'].forEach((v) {
          listBanner.add(new BannerData.fromJson(v));
        });
      }
    } catch (e) {
      handleDioException(e);
    }

    return listBanner;
  }

  Future<List<BannerData>> getShoppingQuickLink(String platform) async {
    Map<String, dynamic> parameters = new Map();
    parameters[AppRemoteParams.paramsPlatform] = platform;
    parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    parameters[AppRemoteParams.paramsVersion] = version;
    Response response = await _dioClient.get(AppRemote.pathShoppingQuickLink, queryParameters: parameters);

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
    parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    parameters[AppRemoteParams.paramsVersion] = version;
    Response response = await _dioClient.get(AppRemote.pathHomeBgBanner, queryParameters: parameters);

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

    Response response = await _dioClient.get(AppRemote.pathShockPrice, queryParameters: parameters);

    if (response.statusCode == 200 && response.data != null) {
      ShockPriceResponse priceResponse = ShockPriceResponse.fromJson(response.data);
      return priceResponse;
    }
    return null;
  }

  Future<List<DynamicBannerData>> getListDynamicBanner(String platform) async {
    Map<String, dynamic> parameters = new Map();
    parameters[AppRemoteParams.paramsPlatform] = platform;
    parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    parameters[AppRemoteParams.paramsVersion] = version;
    Response response = await _dioClient.get(AppRemote.pathDynamicBanner, queryParameters: parameters);

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
    parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    parameters[AppRemoteParams.paramsVersion] = version;
    Response response = await _dioClient.get(AppRemote.pathPersonalHomeData, queryParameters: parameters);

    List<PersonalizationHomeData> listBanner = new List();

    if (response.statusCode == 200 && response.data != null && response.data['widgets'] != null) {
      response.data['widgets'].forEach((v) {
        listBanner.add(new PersonalizationHomeData.fromJson(v));
      });
    }
    return listBanner;
  }

  Future<List<Category>> getListCategory(String platform) async {
    Map<String, dynamic> parameters = new Map();
    parameters[AppRemoteParams.paramsPlatform] = platform;
    parameters[AppRemoteParams.paramsParentId] = 2;
    parameters[AppRemoteParams.paramsAppVersion] = appVersion;
    parameters[AppRemoteParams.paramsVersion] = version;
    Response response = await _dioClient.get(AppRemote.pathCategory, queryParameters: parameters);

    List<Category> listCategory = new List();

    if (response.statusCode == 200 && response.data != null && response.data['data'] != null) {
      response.data['data'].forEach((v) {
        listCategory.add(new Category.fromJson(v));
      });
    }
    return listCategory;
  }
}
