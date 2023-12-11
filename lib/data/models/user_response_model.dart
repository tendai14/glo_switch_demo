class UserResponseModel {
  String? msg;
  bool? success;
  bool? error;

  UserResponseModel({
    this.msg,
    this.success,
    this.error,
  });

  UserResponseModel copyWith({
    String? msg,
    bool? success,
    bool? error,
  }) =>
      UserResponseModel(
        msg: msg ?? this.msg,
        success: success ?? this.success,
        error: error ?? this.error,
      );

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
          msg: json["msg"], success: json["success"], error: json["error"]);
}
