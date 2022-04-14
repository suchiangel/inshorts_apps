

 


class NewsModel {
  String? newsId;
  String? title;
  String? summary;
  String? description;
  String? status;
  String? image;
  String? createdAt;
  String? slug;
  String? newsCategoryId;
  String? newsReporterId;
  String? categoryName;
  String? newsReporterName;

  NewsModel(
      {this.newsId,
      this.title,
      this.summary,
      this.description,
      this.status,
      this.image,
      this.createdAt,
      this.slug,
      this.newsCategoryId,
      this.newsReporterId,
      this.categoryName,
      this.newsReporterName});

  NewsModel.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
    title = json['title'];
    summary = json['summary'];
    description = json['description'];
    status = json['status'];
    image = json['image'];
    createdAt = json['created_at'];
    slug = json['slug'];
    newsCategoryId = json['news_category_id'];
    newsReporterId = json['news_reporter_id'];
    categoryName = json['category_name'];
    newsReporterName = json['news_reporter_name'];
  }

}
