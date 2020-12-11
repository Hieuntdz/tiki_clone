import 'package:tiki_clone/app/data/model/home_tab_data.dart';
import 'package:tiki_clone/app/data/model/shock_price/product.dart';

class PersonalizationHomeData {
  String code;
  String moreLink;
  String placement;
  String type;
  String title;
  List<Product> items;
  String moreLinkText;
  String refreshLink;
  String refreshLinkText;
  List<HomeTabData> tabs;

  PersonalizationHomeData(
      {this.code,
      this.moreLink,
      this.placement,
      this.type,
      this.title,
      this.items,
      this.moreLinkText,
      this.refreshLink,
      this.refreshLinkText,
      this.tabs});

  PersonalizationHomeData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    moreLink = json['more_link'];
    placement = json['placement'];
    type = json['type'];
    title = json['title'];
    if (json['items'] != null) {
      items = new List<Product>();
      json['items'].forEach((v) {
        items.add(new Product.fromJson(v));
      });
    }
    moreLinkText = json['more_link_text'];
    refreshLink = json['refresh_link'];
    refreshLinkText = json['refresh_link_text'];
    if (json['tabs'] != null) {
      tabs = new List<HomeTabData>();
      json['tabs'].forEach((v) {
        tabs.add(new HomeTabData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['more_link'] = this.moreLink;
    data['placement'] = this.placement;
    data['type'] = this.type;
    data['title'] = this.title;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['more_link_text'] = this.moreLinkText;
    data['refresh_link'] = this.refreshLink;
    data['refresh_link_text'] = this.refreshLinkText;
    if (this.tabs != null) {
      data['tabs'] = this.tabs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
