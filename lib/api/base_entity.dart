class BaseEntity<T> {
  num code;
  String message;
  dynamic dataJson;
  T data;

  bool isSuccess() {
    return code == 0;
  }

  BaseEntity.fromJson(Map<String, dynamic> json) {
    if (json["code"] != null) this.code = json['code'] as num;
    if (json["message"] != null) this.message = json['message'] as String;
    if (json["data"] != null) this.dataJson = json["data"];
  }
}
