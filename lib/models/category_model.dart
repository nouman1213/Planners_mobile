class CategoryList {
  final List<Category>? category;

  CategoryList({
    this.category,
  });

  CategoryList.fromJson(Map<String, dynamic> json)
    : category = (json['category'] as List?)?.map((dynamic e) => Category.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'category' : category?.map((e) => e.toJson()).toList()
  };
}

class Category {
  final int? id;
  final String? title;
  final String? metaTag;
  final String? headerImage;
  final String? iconImage;
  final String? arabicTitle;
  final String? arabicDescription;
  final String? description;
  final String? vendorId;
  final String? status;
  final String? parentCategories;
  final dynamic createdAt;
  final dynamic updatedAt;

  Category({
    this.id,
    this.title,
    this.metaTag,
    this.headerImage,
    this.iconImage,
    this.arabicTitle,
    this.arabicDescription,
    this.description,
    this.vendorId,
    this.status,
    this.parentCategories,
    this.createdAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      title = json['title'] as String?,
      metaTag = json['meta_tag'] as String?,
      headerImage = json['header_image'] as String?,
      iconImage = json['icon_image'] as String?,
      arabicTitle = json['arabic_title'] as String?,
      arabicDescription = json['arabic_description'] as String?,
      description = json['description'] as String?,
      vendorId = json['vendor_id'] as String?,
      status = json['status'] as String?,
      parentCategories = json['parent_categories'] as String?,
      createdAt = json['created_at'],
      updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'meta_tag' : metaTag,
    'header_image' : headerImage,
    'icon_image' : iconImage,
    'arabic_title' : arabicTitle,
    'arabic_description' : arabicDescription,
    'description' : description,
    'vendor_id' : vendorId,
    'status' : status,
    'parent_categories' : parentCategories,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}