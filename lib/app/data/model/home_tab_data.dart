import 'package:tiki_clone/app/data/model/shock_price/product.dart';

class HomeTabData {
  String moreLink;
  String icon;
  String type;
  List<Product> items;

  HomeTabData({this.moreLink, this.icon, this.type, this.items});

  HomeTabData.fromJson(Map<String, dynamic> json) {
    moreLink = json['more_link'];
    icon = json['icon'];
    type = json['type'];
    if (json['items'] != null) {
      items = new List<Product>();
      json['items'].forEach((v) {
        items.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['more_link'] = this.moreLink;
    data['icon'] = this.icon;
    data['type'] = this.type;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
