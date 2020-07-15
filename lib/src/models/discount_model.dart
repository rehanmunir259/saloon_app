class DiscountModel {
  String sId;
  int discount;
  String time;

  DiscountModel({this.sId, this.discount, this.time});

  DiscountModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    discount = json['discount'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['discount'] = this.discount;
    data['time'] = this.time;
    return data;
  }
}
