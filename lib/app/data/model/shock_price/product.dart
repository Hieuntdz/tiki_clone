import 'badges.dart';
import 'inventory.dart';

class Product {
  int id;
  Null sku;
  String name;
  String urlPath;
  int price;
  int listPrice;
  List<Badges> badges;
  int discount;
  int ratingAverage;
  int reviewCount;
  int orderCount;
  String thumbnailUrl;
  bool isVisible;
  bool isFresh;
  bool isFlower;
  bool isGiftCard;
  Inventory inventory;
  String urlAttendantInputForm;
  int masterId;
  int sellerProductId;
  String pricePrefix;

  Product(
      {this.id,
      this.sku,
      this.name,
      this.urlPath,
      this.price,
      this.listPrice,
      this.badges,
      this.discount,
      this.ratingAverage,
      this.reviewCount,
      this.orderCount,
      this.thumbnailUrl,
      this.isVisible,
      this.isFresh,
      this.isFlower,
      this.isGiftCard,
      this.inventory,
      this.urlAttendantInputForm,
      this.masterId,
      this.sellerProductId,
      this.pricePrefix});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json['name'];
    urlPath = json['url_path'];
    price = json['price'];
    listPrice = json['list_price'];
    if (json['badges'] != null) {
      badges = new List<Badges>();
      json['badges'].forEach((v) {
        badges.add(new Badges.fromJson(v));
      });
    }
    discount = json['discount'];
    ratingAverage = json['rating_average'];
    reviewCount = json['review_count'];
    orderCount = json['order_count'];
    thumbnailUrl = json['thumbnail_url'];
    isVisible = json['is_visible'];
    isFresh = json['is_fresh'];
    isFlower = json['is_flower'];
    isGiftCard = json['is_gift_card'];
    inventory = json['inventory'] != null ? new Inventory.fromJson(json['inventory']) : null;
    urlAttendantInputForm = json['url_attendant_input_form'];
    masterId = json['master_id'];
    sellerProductId = json['seller_product_id'];
    pricePrefix = json['price_prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['name'] = this.name;
    data['url_path'] = this.urlPath;
    data['price'] = this.price;
    data['list_price'] = this.listPrice;
    if (this.badges != null) {
      data['badges'] = this.badges.map((v) => v.toJson()).toList();
    }
    data['discount'] = this.discount;
    data['rating_average'] = this.ratingAverage;
    data['review_count'] = this.reviewCount;
    data['order_count'] = this.orderCount;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['is_visible'] = this.isVisible;
    data['is_fresh'] = this.isFresh;
    data['is_flower'] = this.isFlower;
    data['is_gift_card'] = this.isGiftCard;
    if (this.inventory != null) {
      data['inventory'] = this.inventory.toJson();
    }
    data['url_attendant_input_form'] = this.urlAttendantInputForm;
    data['master_id'] = this.masterId;
    data['seller_product_id'] = this.sellerProductId;
    data['price_prefix'] = this.pricePrefix;
    return data;
  }
}
