import 'package:tiki_clone/app/data/model/banner_data.dart';

class DynamicBannerData {
  List<BannerData> data;
  String layout;
  String placement;
  String title;
  String titleColor;

  DynamicBannerData({this.data, this.layout, this.placement, this.title, this.titleColor});

  DynamicBannerData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<BannerData>();
      json['data'].forEach((v) {
        data.add(new BannerData.fromJson(v));
      });
    }
    layout = json['layout'];
    placement = json['placement'];
    title = json['title'];
    titleColor = json['title_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['layout'] = this.layout;
    data['placement'] = this.placement;
    data['title'] = this.title;
    data['title_color'] = this.titleColor;
    return data;
  }
}
