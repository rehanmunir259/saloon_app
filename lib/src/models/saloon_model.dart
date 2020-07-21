import 'dart:io';

class SaloonModel {
  String sId;
  String name;
  String address;
  String city;
  String openingTime;
  String closingTime;
  String aboutSaloon;
  String atmosphere;
  String service;
  String language;
  String paymentOption;
  List<ImageData> image;
  List<File> images;


  SaloonModel(
      {this.sId,
      this.name,
      this.address,
      this.images,
      this.city,
      this.image,
      this.openingTime,
      this.closingTime,
      this.aboutSaloon,
      this.atmosphere,
      this.language,
      this.paymentOption,
      this.service});

  SaloonModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
    aboutSaloon = json['aboutSaloon'];
    atmosphere = json['atmosphere'];
    language = json['language'];
    paymentOption = json['paymentOption'];
    service = json['service'];
    if (json['image'] != null) {
      image = new List<ImageData>();
      json['image'].forEach((v) {
        image.add(new ImageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['openingTime'] = this.openingTime;
    data['closingTime'] = this.closingTime;
    data['service'] = this.service;
    data['aboutSaloon'] = this.aboutSaloon;
    data['atmosphere'] = this.atmosphere;
    data['language'] = this.language;
    data['paymentOption'] = this.paymentOption;
    if (this.image != null) {
      data['image'] = this.image.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageData {
  String sId;
  String name;
  String path;

  ImageData({this.sId, this.name, this.path});

  ImageData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['path'] = this.path;
    return data;
  }
}
