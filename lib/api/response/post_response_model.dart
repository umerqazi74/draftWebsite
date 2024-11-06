class PostResponseModel {
  bool? error;
  String? errorMsg;
  String? status;

  PostResponseModel({this.error, this.errorMsg,this.status});

  PostResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorMsg = json['errorMsg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['errorMsg'] = errorMsg;
    data['status'] = status;
    return data;
  }
}
