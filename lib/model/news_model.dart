class NewsModel {
  String id;
  String categoryName;
  String imageUrl;
  String title;
  String description;
  // String subdescription;
  // String subtitle;
  String slugCategory = "";

  NewsModel({
    required this.id,
    required this.categoryName,
    required this.imageUrl,
    required this.description,
    required this.slugCategory,
    required this.title,
  });

  factory NewsModel.fromjson(Map<String, dynamic> json) {
    return NewsModel(
      id: json["id"].toString(),
      categoryName: json["category_name"].toString(),
      imageUrl: json["image_large"].toString(),
      description: json["news"].toString(),
      // subdescription: json["product_value"].toString(),
      title: json["title"].toString(),
      // subtitle: json["product_value"].toString(),
      slugCategory: json["slug"].toString(),
    );
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> newsList = new Map<String, dynamic>();

    newsList['id'] = this.id;
    newsList['category_name'] = this.categoryName;
    newsList['image_large'] = this.imageUrl;
    newsList['news'] = this.description;
    newsList['title'] = this.title;
    newsList['slug'] = this.slugCategory;

    return newsList;
  }
}
