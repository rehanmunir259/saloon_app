class ReservationModel {
  bool status;
  String sId;
  String saloon;
  int code;
  String personName;
  int noOfPerson;
  String email;
  String reservationTime;
  String date;
  int contact;
  int discount;
  String createdAt;
  String updatedAt;

  ReservationModel(
      {this.status,
      this.sId,
      this.saloon,
      this.code,
      this.personName,
      this.noOfPerson,
      this.email,
      this.reservationTime,
      this.date,
      this.contact,
      this.discount,
      this.createdAt,
      this.updatedAt,
      });

  ReservationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    saloon = json['saloon'];
    code = json['code'];
    personName = json['personName'];
    noOfPerson = json['noOfPerson'];
    email = json['email'];
    reservationTime = json['reservationTime'];
    date = json['date'];
    contact = json['contact'];
    discount = json['discount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['saloon'] = this.saloon;
    data['code'] = this.code;
    data['personName'] = this.personName;
    data['noOfPerson'] = this.noOfPerson;
    data['email'] = this.email;
    data['reservationTime'] = this.reservationTime;
    data['date'] = this.date;
    data['contact'] = this.contact;
    data['discount'] = this.discount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
