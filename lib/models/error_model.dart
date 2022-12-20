class Error {
  String error;

  Error({
    required this.error,
  });

  factory Error.fromJson(dynamic jsonData) {
    return Error(
      error: jsonData["error"],
    );
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> map ={};
    map["error"] = error;
    return map;
  }
}
