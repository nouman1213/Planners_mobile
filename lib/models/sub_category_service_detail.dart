class SubCategoriesServiceDetail {
  final Category? category;
  final Service? service;
  final List<SubImages>? subImages;

  SubCategoriesServiceDetail({
    this.category,
    this.service,
    this.subImages,
  });

  SubCategoriesServiceDetail.fromJson(Map<String, dynamic> json)
    : category = (json['category'] as Map<String,dynamic>?) != null ? Category.fromJson(json['category'] as Map<String,dynamic>) : null,
      service = (json['service'] as Map<String,dynamic>?) != null ? Service.fromJson(json['service'] as Map<String,dynamic>) : null,
      subImages = (json['sub_images'] as List?)?.map((dynamic e) => SubImages.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'category' : category?.toJson(),
    'service' : service?.toJson(),
    'sub_images' : subImages?.map((e) => e.toJson()).toList()
  };
}

class Category {
  final String? id;
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
    : id = json['id'] as String?,
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

class Service {
  final int? id;
  final String? titleEn;
  final String? coverImage;
  final String? titleArabic;
  final String? descriptionArabic;
  final String? descriptionEn;
  final String? address;
  final String? mobileNumber;
  final String? city;
  final String? catId;
  final String? parentId;
  final String? amount;
  final String? vendorId;
  final dynamic rating;
  final String? capicity;
  final dynamic createdAt;
  final dynamic updatedAt;
  final List<Add>? add;

  Service({
    this.id,
    this.titleEn,
    this.coverImage,
    this.titleArabic,
    this.descriptionArabic,
    this.descriptionEn,
    this.address,
    this.mobileNumber,
    this.city,
    this.catId,
    this.parentId,
    this.amount,
    this.vendorId,
    this.rating,
    this.capicity,
    this.createdAt,
    this.updatedAt,
    this.add,
  });

  Service.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      titleEn = json['title_en'] as String?,
      coverImage = json['cover_image'] as String?,
      titleArabic = json['title_arabic'] as String?,
      descriptionArabic = json['description_arabic'] as String?,
      descriptionEn = json['description_en'] as String?,
      address = json['address'] as String?,
      mobileNumber = json['mobile_number'] as String?,
      city = json['city'] as String?,
      catId = json['cat_id'] as String?,
      parentId = json['parent_id'] as String?,
      amount = json['amount'] as String?,
      vendorId = json['vendor_id'] as String?,
      rating = json['rating'],
      capicity = json['capicity'] as String?,
      createdAt = json['created_at'],
      updatedAt = json['updated_at'],
      add = (json['add'] as List?)?.map((dynamic e) => Add.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title_en' : titleEn,
    'cover_image' : coverImage,
    'title_arabic' : titleArabic,
    'description_arabic' : descriptionArabic,
    'description_en' : descriptionEn,
    'address' : address,
    'mobile_number' : mobileNumber,
    'city' : city,
    'cat_id' : catId,
    'parent_id' : parentId,
    'amount' : amount,
    'vendor_id' : vendorId,
    'rating' : rating,
    'capicity' : capicity,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'add' : add?.map((e) => e.toJson()).toList()
  };
}

class Add {
  final int? id;
  final String? serviceId;
  final String? title;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  Add({
    this.id,
    this.serviceId,
    this.title,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  Add.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      serviceId = json['service_id'] as String?,
      title = json['title'] as String?,
      image = json['image'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'service_id' : serviceId,
    'title' : title,
    'image' : image,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class SubImages {
  final String? id;
  final String? imagePath;
  final String? serviceId;
  final dynamic createdAt;
  final dynamic updatedAt;

  SubImages({
    this.id,
    this.imagePath,
    this.serviceId,
    this.createdAt,
    this.updatedAt,
  });

  SubImages.fromJson(Map<String, dynamic> json)
    : id = json['id'] as String?,
      imagePath = json['image_path'] as String?,
      serviceId = json['service_id'] as String?,
      createdAt = json['created_at'],
      updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'image_path' : imagePath,
    'service_id' : serviceId,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}