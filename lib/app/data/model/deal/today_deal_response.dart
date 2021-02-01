import 'package:tiki_clone/app/data/model/deal/deal_data.dart';
import 'package:tiki_clone/app/data/model/shock_price/filters.dart';
import 'package:tiki_clone/app/data/model/shock_price/paging.dart';

class TodayDealResponse {
  List<DealData> _data;
  Paging _paging;
  Filters _filters;
  String _version;

  List<DealData> get data => _data;

  Paging get paging => _paging;

  Filters get filters => _filters;

  String get version => _version;

  TodayDealResponse(
      {List<DealData> data, Paging paging, Filters filters, String version}) {
    _data = data;
    _paging = paging;
    _filters = filters;
    _version = version;
  }

  TodayDealResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        data.add(new DealData.fromJson(v));
      });
    }
    _paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    _filters =
        json['filters'] != null ? new Filters.fromJson(json['filters']) : null;
    _version = json['version'];
  }
}
