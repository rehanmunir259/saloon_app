class FormModel {
  String name;
  String address;
  String country;
  String city;

  FormModel({this.name, this.address, this.country, this.city});
  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      name: json['name'],
      address: json['address'],
      country: json['country'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['country'] = this.country;
    data['city'] = this.city;
    return data;
  }
}
