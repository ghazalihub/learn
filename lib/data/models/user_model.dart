class UserModel {
  String? userId;
  String? name;
  String? email;
  String? phone;
  List<String>? enrolledCourses;
  String? profileImageUrl;
  String? joinedAt;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.phone,
    this.enrolledCourses,
    this.profileImageUrl,
    this.joinedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      enrolledCourses: json['enrolledCourses'] != null
          ? List<String>.from(json['enrolledCourses'])
          : [],
      profileImageUrl: json['profileImageUrl'],
      joinedAt: json['joinedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'enrolledCourses': enrolledCourses,
      'profileImageUrl': profileImageUrl,
      'joinedAt': joinedAt,
    };
  }
}

class UserProgress {
  String? courseId;
  List<String>? completedLessonIds;
  String? lastWatchedLessonId;
  int? lastPosition;

  UserProgress({
    this.courseId,
    this.completedLessonIds,
    this.lastWatchedLessonId,
    this.lastPosition,
  });

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      courseId: json['courseId'],
      completedLessonIds: json['completedLessonIds'] != null
          ? List<String>.from(json['completedLessonIds'])
          : [],
      lastWatchedLessonId: json['lastWatchedLessonId'],
      lastPosition: json['lastPosition'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
      'completedLessonIds': completedLessonIds,
      'lastWatchedLessonId': lastWatchedLessonId,
      'lastPosition': lastPosition,
    };
  }
}
