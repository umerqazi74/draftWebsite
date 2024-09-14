class PostResponseModel {
  bool? error;
  String? errorMsg;

  PostResponseModel({this.error, this.errorMsg});

  PostResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['errorMsg'] = errorMsg;
    return data;
  }
}
