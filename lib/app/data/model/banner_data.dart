class BannerData {
  int id;
  String title;
  String content;
  String url;
  String imageUrl;
  String thumbnailUrl;
  String mobileUrl;
  double ratio;
  bool authentication;

  BannerData(
      {this.id, this.title, this.content, this.url, this.imageUrl, this.thumbnailUrl, this.mobileUrl, this.ratio});

  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    url = json['url'];
    imageUrl = json['image_url'];
    thumbnailUrl = json['thumbnail_url'];
    mobileUrl = json['mobile_url'];
    ratio = json['ratio'];
    authentication = json['authentication'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['mobile_url'] = this.mobileUrl;
    data['ratio'] = this.ratio;
    data['authentication'] = this.authentication;
    return data;
  }
}
