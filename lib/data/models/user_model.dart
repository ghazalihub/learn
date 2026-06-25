class UserModel {
  String? userId;
  String? name;
  String? email;
  String? phone;
  List<String>? enrolledCourses;
  String? profileImageUrl;
  DateTime? joinedAt;

  UserModel({this.userId, this.name, this.email, this.phone, this.enrolledCourses, this.profileImageUrl, this.joinedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    enrolledCourses = json['enrolledCourses']?.cast<String>();
    profileImageUrl = json['profileImageUrl'];
    joinedAt = json['joinedAt'] != null ? DateTime.parse(json['joinedAt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['enrolledCourses'] = enrolledCourses;
    data['profileImageUrl'] = profileImageUrl;
    data['joinedAt'] = joinedAt?.toIso8601String();
    return data;
  }
}
