class Progress {
  int qty;
  int qtyOrdered;
  int qtyRemain;
  int percent;
  String status;
  String progressText;
  int orderedPercent;

  Progress(
      {this.qty, this.qtyOrdered, this.qtyRemain, this.percent, this.status, this.progressText, this.orderedPercent});

  Progress.fromJson(Map<String, dynamic> json) {
    qty = json['qty'];
    qtyOrdered = json['qty_ordered'];
    qtyRemain = json['qty_remain'];
    percent = json['percent'];
    status = json['status'];
    progressText = json['progress_text'];
    orderedPercent = json['ordered_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qty'] = this.qty;
    data['qty_ordered'] = this.qtyOrdered;
    data['qty_remain'] = this.qtyRemain;
    data['percent'] = this.percent;
    data['status'] = this.status;
    data['progress_text'] = this.progressText;
    data['ordered_percent'] = this.orderedPercent;
    return data;
  }
}
