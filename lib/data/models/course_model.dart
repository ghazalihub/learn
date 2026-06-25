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

  CourseModel({this.id, this.title, this.category, this.description, this.thumbnailUrl, this.instructorName, this.instructorImage, this.price, this.currency, this.isFree, this.isFeatured, this.validityDays, this.lastEditDate, this.lessons});

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
