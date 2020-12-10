import 'package:tiki_clone/app/data/model/shock_price/filters.dart';
import 'package:tiki_clone/app/data/model/shock_price/paging.dart';
import 'package:tiki_clone/app/data/model/shock_price/shock_price_data.dart';

class ShockPriceResponse {
  List<ShockPriceData> data;
  Paging paging;
  Filters filters;
  String version;

  ShockPriceResponse({this.data, this.paging, this.filters, this.version});

  ShockPriceResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ShockPriceData>();
      json['data'].forEach((v) {
        data.add(new ShockPriceData.fromJson(v));
      });
    }
    paging = json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    filters = json['filters'] != null ? new Filters.fromJson(json['filters']) : null;
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    if (this.filters != null) {
      data['filters'] = this.filters.toJson();
    }
    data['version'] = this.version;
    return data;
  }
}
