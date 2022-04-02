class UserModel {
  String? uId;
  String? name;
  String? email;
  String? phone;
  String? university;
  String? image;
  String? bio;
  String? uToken;

  UserModel({
    this.uToken,
    this.university,
    this.bio,
    this.uId,
    this.name,
    this.email,
    this.phone,
    this.image,
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    uId = json!['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    university = json['university'];
    bio = json['bio'];
    uToken = json['uToken'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = uId;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['university'] = university;
    data['image'] = image;
    data['bio'] = bio;
    data['uToken'] = uToken;
    return data;
  }
}