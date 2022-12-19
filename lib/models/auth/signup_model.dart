class SignUp {
  int id;
  String email;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastname;
  dynamic phone;
  dynamic gender;
  dynamic address;
  String apiToken;
  dynamic role;
  dynamic dob;
  dynamic profileImage;
  dynamic coverImage;
  dynamic provider;
  dynamic uid;

  SignUp(
      {required this.id,
      required this.email,
      required this.apiToken,
      this.createdAt,
      this.updatedAt,
      this.firstName,
      this.lastname,
      this.phone,
      this.gender,
      this.address,
      this.role,
      this.dob,
      this.profileImage,
      this.coverImage,
      this.provider,
      this.uid});

  factory SignUp.fromJson(Map<String, dynamic> jsonData) {
    return SignUp(
      id: jsonData["id"],
      email: jsonData["email"],
      apiToken: jsonData["api_token"],
      createdAt: jsonData["created_at"],
      updatedAt: jsonData["updated_at"],
      firstName: jsonData["first_name"],
      lastname: jsonData["last_name"],
      phone: jsonData["phone"],
      gender: jsonData["gender"],
      address: jsonData["address"],
      role: jsonData["role"],
      dob: jsonData["dob"],
      profileImage: jsonData["profile_img"],
      coverImage: jsonData["cover_img"],
      provider: jsonData["provider"],
      uid: jsonData["uid"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["id"] = id;
    map["email"] = email;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["first_name"] = firstName;
    map["last_name"] = lastname;
    map["phone"] = phone;
    map["gender"] = gender;
    map["address"] = address;
    map["api_token"] = apiToken;
    map["role"] = role;
    map["dob"] = dob;
    map["profile_img"] = profileImage;
    map["cover_img"] = coverImage;
    map["provider"] = coverImage;
    map["uid"] = coverImage;

    return map;
  }
}
