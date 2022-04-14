class CategoryListModel {
  bool? status;
  String? message;
  List<CategoryList>? data;

  CategoryListModel({this.status, this.message, this.data,});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryList>[];
      json['data'].forEach((v) {
        data!.add(CategoryList.fromJson(v));
      });
    }
  }
}

class CategoryList {
  String? newsCategoryId;
  String? name;

  CategoryList({this.newsCategoryId, this.name});

  CategoryList.fromJson(Map<String, dynamic> json) {
    newsCategoryId = json['news_category_id'];
    name = json['name'];
  }
}