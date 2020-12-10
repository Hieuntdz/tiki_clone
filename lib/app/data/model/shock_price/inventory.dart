class Inventory {
  Null productVirtualType;
  String fulfillmentType;

  Inventory({this.productVirtualType, this.fulfillmentType});

  Inventory.fromJson(Map<String, dynamic> json) {
    productVirtualType = json['product_virtual_type'];
    fulfillmentType = json['fulfillment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_virtual_type'] = this.productVirtualType;
    data['fulfillment_type'] = this.fulfillmentType;
    return data;
  }
}
