class ForgotPasswordResponse {
  String success;

  ForgotPasswordResponse({required this.success});

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> jsonData) {
    return ForgotPasswordResponse(
      success: jsonData["success"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["success"] = success;
    return map;
  }
}
