
class CourseModel {
  String? id;
  String? title;
  String? category;
  String? description;
  String? thumbnailUrl;
  String? instructorName;
  String? instructorImage;
  double? price;
  String? currency;
  bool? isFree;
  int? validityDays;
  String? lastEditDate;
  List<LessonModel>? lessons;
  List<ReviewModel>? reviews;
  bool? isFeatured;
  double? rating;
  int? reviewCount;

  CourseModel({
    this.id,
    this.title,
    this.category,
    this.description,
    this.thumbnailUrl,
    this.instructorName,
    this.instructorImage,
    this.price,
    this.currency,
    this.isFree,
    this.validityDays,
    this.lastEditDate,
    this.lessons,
    this.reviews,
    this.isFeatured,
    this.rating,
    this.reviewCount,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      thumbnailUrl: json['thumbnailUrl'],
      instructorName: json['instructorName'],
      instructorImage: json['instructorImage'],
      price: json['price']?.toDouble(),
      currency: json['currency'],
      isFree: json['isFree'],
      validityDays: json['validityDays'],
      lastEditDate: json['lastEditDate'],
      lessons: json['lessons'] != null
          ? (json['lessons'] as List).map((i) => LessonModel.fromJson(i)).toList()
          : null,
      reviews: json['reviews'] != null
          ? (json['reviews'] as List).map((i) => ReviewModel.fromJson(i)).toList()
          : null,
      isFeatured: json['isFeatured'],
      rating: json['rating']?.toDouble(),
      reviewCount: json['reviewCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
      'instructorName': instructorName,
      'instructorImage': instructorImage,
      'price': price,
      'currency': currency,
      'isFree': isFree,
      'validityDays': validityDays,
      'lastEditDate': lastEditDate,
      'lessons': lessons?.map((v) => v.toJson()).toList(),
      'reviews': reviews?.map((v) => v.toJson()).toList(),
      'isFeatured': isFeatured,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }
}

class LessonModel {
  String? id;
  String? title;
  String? duration;
  String? youtubeUrl;
  bool? isPreview;
  int? order;

  LessonModel({
    this.id,
    this.title,
    this.duration,
    this.youtubeUrl,
    this.isPreview,
    this.order,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'],
      title: json['title'],
      duration: json['duration'],
      youtubeUrl: json['youtubeUrl'],
      isPreview: json['isPreview'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'youtubeUrl': youtubeUrl,
      'isPreview': isPreview,
      'order': order,
    };
  }
}

class CategoryModel {
  String? id;
  String? title;
  String? icon;
  String? colorHex;

  CategoryModel({
    this.id,
    this.title,
    this.icon,
    this.colorHex,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      colorHex: json['colorHex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'colorHex': colorHex,
    };
  }
}

class BannerModel {
  String? imageUrl;
  String? linkCourseId;
  String? title;

  BannerModel({
    this.imageUrl,
    this.linkCourseId,
    this.title,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      imageUrl: json['imageUrl'],
      linkCourseId: json['linkCourseId'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'linkCourseId': linkCourseId,
      'title': title,
    };
  }
}

class ReviewModel {
  String? id;
  String? userName;
  String? userImage;
  String? comment;
  double? rating;
  String? date;

  ReviewModel({
    this.id,
    this.userName,
    this.userImage,
    this.comment,
    this.rating,
    this.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      userName: json['userName'],
      userImage: json['userImage'],
      comment: json['comment'],
      rating: json['rating']?.toDouble(),
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'userImage': userImage,
      'comment': comment,
      'rating': rating,
      'date': date,
    };
  }
}
