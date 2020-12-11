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
  double ratingAverage;
  int reviewCount;
  int orderCount;
  String thumbnailUrl;
  List<String> thumbnailUrls;
  bool isVisible;
  bool isFresh;
  bool isFlower;
  bool isGiftCard;
  Inventory inventory;
  String urlAttendantInputForm;
  int masterId;
  int sellerProductId;
  String pricePrefix;

  int defaultSpid;
  String type;
  int discountRate;
  String inventoryStatus;
  String urlKey;
  String title;
  String subTitle;

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
      this.pricePrefix,
      this.defaultSpid,
      this.type,
      this.discountRate,
      this.inventoryStatus,
      this.urlKey,
      this.thumbnailUrls,
      this.title,
      this.subTitle});

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
    if (json['rating_average'] != null) {
      ratingAverage = json['rating_average'].toDouble();
    }

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

    defaultSpid = json['default_spid'];
    type = json['type'];
    discountRate = json['discount_rate'];
    inventoryStatus = json['inventory_status'];
    urlKey = json['url_key'];

    if (json['thumbnail_urls'] != null) {
      thumbnailUrls = new List<String>();
      json['thumbnail_urls'].forEach((v) {
        thumbnailUrls.add(v);
      });
    }

    title = json['title'];
    subTitle = json['subtitle'];
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

    data['default_spid'] = this.defaultSpid;
    data['type'] = this.type;
    data['discount_rate'] = this.discountRate;
    data['inventory_status'] = this.inventoryStatus;
    data['url_key'] = this.urlKey;

    if (thumbnailUrls != null) {
      data['thumbnail_urls'] = this.thumbnailUrls.map((e) => e).toList();
    }

    data[title] = this.title;
    data[subTitle] = this.subTitle;

    return data;
  }
}
