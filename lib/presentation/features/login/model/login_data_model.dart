class LoginDataModel {
  String? status;
  int? statusCode;
  Data? data;
  List<dynamic>? errors; // Changed from List<Null> to List<dynamic>

  LoginDataModel({this.status, this.statusCode, this.data, this.errors});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errors = json['errors']; // Assume it's a list of dynamic (strings, maps, etc.)
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['status'] = status;
    map['statusCode'] = statusCode;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    if (errors != null) {
      map['errors'] = errors; // No toJson call because it's dynamic
    }
    return map;
  }
}

class Data {
  String? accessToken;
  String? refreshToken;

  Data({this.accessToken, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    return map;
  }
}
