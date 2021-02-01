import 'package:tiki_clone/app/data/model/shock_price/product.dart';
import 'package:tiki_clone/app/data/model/shock_price/progress.dart';

class DealData {
  int _dealId;
  String _dealStatus;
  int _dealVersion;
  int _status;
  String _url;
  String _tags;
  int _discountPercent;
  int _specialPrice;
  int _specialFromDate;
  String _fromDate;
  int _specialToDate;
  Progress _progress;
  Product _product;

  int get dealId => _dealId;

  String get dealStatus => _dealStatus;

  int get dealVersion => _dealVersion;

  int get status => _status;

  String get url => _url;

  String get tags => _tags;

  int get discountPercent => _discountPercent;

  int get specialPrice => _specialPrice;

  int get specialFromDate => _specialFromDate;

  String get fromDate => _fromDate;

  int get specialToDate => _specialToDate;

  Product get product => _product;

  Progress get progress => _progress;

  DealData(
      {int dealId,
      String dealStatus,
      int dealVersion,
      int status,
      String url,
      String tags,
      int discountPercent,
      int specialPrice,
      int specialFromDate,
      String fromDate,
      int specialToDate,
      Product product,
      Progress progress}) {
    _dealId = dealId;
    _dealStatus = dealStatus;
    _dealVersion = dealVersion;
    _status = status;
    _url = url;
    _tags = tags;
    _discountPercent = discountPercent;
    _specialPrice = specialPrice;
    _specialFromDate = specialFromDate;
    _fromDate = fromDate;
    _specialToDate = specialToDate;
    _progress = progress;
    _product = product;
  }

  DealData.fromJson(dynamic json) {
    _dealId = json["deal_id"];
    _dealStatus = json["deal_status"];
    _dealVersion = json["deal_version"];
    _status = json["status"];
    _url = json["url"];
    _tags = json["tags"];
    _discountPercent = json["discount_percent"];
    _specialPrice = json["special_price"];
    _specialFromDate = json["special_from_date"];
    _fromDate = json["from_date"];
    _specialToDate = json["special_to_date"];
    _progress = json['progress'] != null
        ? new Progress.fromJson(json['progress'])
        : null;
    _product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["deal_id"] = _dealId;
    map["deal_status"] = _dealStatus;
    map["deal_version"] = _dealVersion;
    map["status"] = _status;
    map["url"] = _url;
    map["tags"] = _tags;
    map["discount_percent"] = _discountPercent;
    map["special_price"] = _specialPrice;
    map["special_from_date"] = _specialFromDate;
    map["from_date"] = _fromDate;
    map["special_to_date"] = _specialToDate;

    if (this.progress != null) {
      map['progress'] = this.progress.toJson();
    }
    if (this.product != null) {
      map['product'] = this.product.toJson();
    }

    return map;
  }
}
