import 'package:tiki_clone/app/data/model/shock_price/product.dart';
import 'package:tiki_clone/app/data/model/shock_price/progress.dart';

class ShockPriceData {
  int dealId;
  String dealStatus;
  int dealVersion;
  int status;
  String url;
  String tags;
  int discountPercent;
  int specialPrice;
  int specialFromDate;
  String fromDate;
  int specialToDate;
  Progress progress;
  Product product;

  ShockPriceData(
      {this.dealId,
      this.dealStatus,
      this.dealVersion,
      this.status,
      this.url,
      this.tags,
      this.discountPercent,
      this.specialPrice,
      this.specialFromDate,
      this.fromDate,
      this.specialToDate,
      this.progress,
      this.product});

  ShockPriceData.fromJson(Map<String, dynamic> json) {
    dealId = json['deal_id'];
    dealStatus = json['deal_status'];
    dealVersion = json['deal_version'];
    status = json['status'];
    url = json['url'];
    tags = json['tags'];
    discountPercent = json['discount_percent'];
    specialPrice = json['special_price'];
    specialFromDate = json['special_from_date'];
    fromDate = json['from_date'];
    specialToDate = json['special_to_date'];
    progress = json['progress'] != null ? new Progress.fromJson(json['progress']) : null;
    product = json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deal_id'] = this.dealId;
    data['deal_status'] = this.dealStatus;
    data['deal_version'] = this.dealVersion;
    data['status'] = this.status;
    data['url'] = this.url;
    data['tags'] = this.tags;
    data['discount_percent'] = this.discountPercent;
    data['special_price'] = this.specialPrice;
    data['special_from_date'] = this.specialFromDate;
    data['from_date'] = this.fromDate;
    data['special_to_date'] = this.specialToDate;
    if (this.progress != null) {
      data['progress'] = this.progress.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}
