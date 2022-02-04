import 'dart:convert';

class ServiceModel {
  late String name;
  late String tag;
  late String detail;
  late String cost;
  late String img;
  late String duration;
  late String status;
  late String timeStamp;

  ServiceModel(
      {this.name = "NAME",
        this.img = "Img",
      this.tag = "TAG",
      this.detail = "DETAIL",
      this.cost = "5000",
      this.duration = "30",
      this.status = "1",
      this.timeStamp = "TIMESTAMP"});

  factory ServiceModel.fromMap(Map json) {
    return ServiceModel(
        name: json["name"],
        img: json["image"],
        tag: json["tagline"],
        detail: json['details'],
        cost: json['cost'],
        duration: json['duration'],
        status: json['status'],
        timeStamp: json['timestamp']);
  }
}
