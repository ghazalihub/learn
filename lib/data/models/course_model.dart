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
  bool? isFeatured;
  int? validityDays;
  DateTime? lastEditDate;
  List<LessonModel>? lessons;
  List<ReviewModel>? reviews;

  CourseModel({this.id, this.title, this.category, this.description, this.thumbnailUrl, this.instructorName, this.instructorImage, this.price, this.currency, this.isFree, this.isFeatured, this.validityDays, this.lastEditDate, this.lessons, this.reviews});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'];
    description = json['description'];
    thumbnailUrl = json['thumbnailUrl'];
    instructorName = json['instructorName'];
    instructorImage = json['instructorImage'];
    price = json['price']?.toDouble();
    currency = json['currency'];
    isFree = json['isFree'];
    isFeatured = json['isFeatured'];
    validityDays = json['validityDays'];
    lastEditDate = json['lastEditDate'] != null ? DateTime.parse(json['lastEditDate']) : null;
    if (json['lessons'] != null) {
      lessons = <LessonModel>[];
      json['lessons'].forEach((v) { lessons!.add(LessonModel.fromJson(v)); });
    }
    if (json['reviews'] != null) {
      reviews = <ReviewModel>[];
      json['reviews'].forEach((v) { reviews!.add(ReviewModel.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['category'] = category;
    data['description'] = description;
    data['thumbnailUrl'] = thumbnailUrl;
    data['instructorName'] = instructorName;
    data['instructorImage'] = instructorImage;
    data['price'] = price;
    data['currency'] = currency;
    data['isFree'] = isFree;
    data['isFeatured'] = isFeatured;
    data['validityDays'] = validityDays;
    data['lastEditDate'] = lastEditDate?.toIso8601String();
    if (lessons != null) {
      data['lessons'] = lessons!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReviewModel {
  String? id;
  String? name;
  String? image;
  String? review;
  double? rating;

  ReviewModel({this.id, this.name, this.image, this.review, this.rating});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    review = json['review'];
    rating = json['rating']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['review'] = review;
    data['rating'] = rating;
    return data;
  }
}

class LessonModel {
  String? id;
  String? title;
  String? duration;
  String? youtubeUrl;
  bool? isPreview;
  int? order;

  LessonModel({this.id, this.title, this.duration, this.youtubeUrl, this.isPreview, this.order});

  LessonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    duration = json['duration'];
    youtubeUrl = json['youtubeUrl'];
    isPreview = json['isPreview'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['duration'] = duration;
    data['youtubeUrl'] = youtubeUrl;
    data['isPreview'] = isPreview;
    data['order'] = order;
    return data;
  }
}

class CategoryModel {
  String? id;
  String? title;
  String? icon;
  String? colorHex;
  CategoryModel({this.id, this.title, this.icon, this.colorHex});
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    colorHex = json['colorHex'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['icon'] = icon;
    data['colorHex'] = colorHex;
    return data;
  }
}

class BannerModel {
  String? imageUrl;
  String? linkCourseId;
  String? title;
  BannerModel({this.imageUrl, this.linkCourseId, this.title});
  BannerModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    linkCourseId = json['linkCourseId'];
    title = json['title'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['linkCourseId'] = linkCourseId;
    data['title'] = title;
    return data;
  }
}

class InstructorModel {
  String? id;
  String? name;
  String? image;
  String? role;
  InstructorModel({this.id, this.name, this.image, this.role});
  InstructorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    role = json['role'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['role'] = role;
    return data;
  }
}
