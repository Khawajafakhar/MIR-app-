class ForgotPassword {
  String success;

  ForgotPassword({required this.success});

  factory ForgotPassword.fromJson(Map<String, dynamic> jsonData) {
    return ForgotPassword(
      success: jsonData["success"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["success"] = success;
    return map;
  }
}
