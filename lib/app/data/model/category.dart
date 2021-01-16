import 'package:tiki_clone/app/data/model/category_children.dart';

class Category {
  int id;
  int parentId;
  String name;
  String type;
  String urlKey;
  int level;
  String status;
  bool includeInMenu;
  int productCount;
  bool isLeaf;
  String metaTitle;
  String metaDescription;
  Null metaKeywords;
  String thumbnailUrl;
  List<CategoryChildren> children;

  Category(
      {this.id,
      this.parentId,
      this.name,
      this.type,
      this.urlKey,
      this.level,
      this.status,
      this.includeInMenu,
      this.productCount,
      this.isLeaf,
      this.metaTitle,
      this.metaDescription,
      this.metaKeywords,
      this.thumbnailUrl,this.children});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    type = json['type'];
    urlKey = json['url_key'];
    level = json['level'];
    status = json['status'];
    includeInMenu = json['include_in_menu'];
    productCount = json['product_count'];
    isLeaf = json['is_leaf'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    thumbnailUrl = json['thumbnail_url'];

    if (json["children"] != null) {
      children = [];
      json["children"].forEach((v) {
        children.add(CategoryChildren.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['url_key'] = this.urlKey;
    data['level'] = this.level;
    data['status'] = this.status;
    data['include_in_menu'] = this.includeInMenu;
    data['product_count'] = this.productCount;
    data['is_leaf'] = this.isLeaf;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_keywords'] = this.metaKeywords;
    data['thumbnail_url'] = this.thumbnailUrl;

    if (children != null) {
      data["children"] = children.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
