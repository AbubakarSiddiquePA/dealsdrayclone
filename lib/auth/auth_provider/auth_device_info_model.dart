import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  int? status;
  Data? data;

  ResponseModel({
    this.status,
    this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  String? message;
  String? userId;
  String? deviceId;

  Data({
    this.message,
    this.userId,
    this.deviceId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        userId: json["userId"],
        deviceId: json["deviceId"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "userId": userId,
        "deviceId": deviceId,
      };
}
