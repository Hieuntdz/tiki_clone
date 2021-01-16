/// id : 2552
/// name : "Tã dán"
/// type : null
/// children : []
/// include_in_menu : true
/// url_key : "ta-dan"
/// product_count : 588
/// thumbnail_url : "https://salt.tikicdn.com/cache/280x280/ts/product/8e/11/36/aa47cd545651fde912b3d4cfd9b2e5d1.jpg"
/// is_leaf : true

class CategoryChildren {
  int _id;
  String _name;
  dynamic _type;
  List<dynamic> _children;
  bool _includeInMenu;
  String _urlKey;
  int _productCount;
  String _thumbnailUrl;
  bool _isLeaf;

  int get id => _id;
  String get name => _name;
  dynamic get type => _type;
  List<dynamic> get children => _children;
  bool get includeInMenu => _includeInMenu;
  String get urlKey => _urlKey;
  int get productCount => _productCount;
  String get thumbnailUrl => _thumbnailUrl;
  bool get isLeaf => _isLeaf;

  CategoryChildren({
      int id, 
      String name, 
      dynamic type, 
      List<dynamic> children, 
      bool includeInMenu, 
      String urlKey, 
      int productCount, 
      String thumbnailUrl, 
      bool isLeaf}){
    _id = id;
    _name = name;
    _type = type;
    _children = children;
    _includeInMenu = includeInMenu;
    _urlKey = urlKey;
    _productCount = productCount;
    _thumbnailUrl = thumbnailUrl;
    _isLeaf = isLeaf;
}

  CategoryChildren.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _type = json["type"];
    // if (json["children"] != null) {
    //   _children = [];
    //   json["children"].forEach((v) {
    //     _children.add(v.fromJson(v));
    //   });
    // }
    _includeInMenu = json["include_in_menu"];
    _urlKey = json["url_key"];
    _productCount = json["product_count"];
    _thumbnailUrl = json["thumbnail_url"];
    _isLeaf = json["is_leaf"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["type"] = _type;
    if (_children != null) {
      map["children"] = _children.map((v) => v.toJson()).toList();
    }
    map["include_in_menu"] = _includeInMenu;
    map["url_key"] = _urlKey;
    map["product_count"] = _productCount;
    map["thumbnail_url"] = _thumbnailUrl;
    map["is_leaf"] = _isLeaf;
    return map;
  }

}