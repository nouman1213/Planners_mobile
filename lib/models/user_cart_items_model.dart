class UserCartItemsModel {
  final bool? status;
  final User? user;
  final List<Bookings>? bookings;
  final List<Service>? service;

  UserCartItemsModel({
    this.status,
    this.user,
    this.bookings,
    this.service,
  });

  UserCartItemsModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        bookings = (json['bookings'] as List?)
            ?.map((dynamic e) => Bookings.fromJson(e as Map<String, dynamic>))
            .toList(),
        service = (json['service'] as List?)
            ?.map((dynamic e) => Service.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'user': user?.toJson(),
        'bookings': bookings?.map((e) => e.toJson()).toList(),
        'service': service?.map((e) => e.toJson()).toList()
      };
}

class User {
  final String? id;
  final String? fName;
  final String? lName;
  final String? email;
  final dynamic emailVerifiedAt;
  final String? password;
  final String? phone;
  final dynamic emailVerify;
  final dynamic socialId;
  final dynamic socialType;
  final String? status;
  final String? image;
  final String? address;
  final String? location;
  final dynamic storeName;
  final String? verifyEmailToken;
  final dynamic rememberToken;
  final String? createdAt;
  final String? updatedAt;

  User({
    this.id,
    this.fName,
    this.lName,
    this.email,
    this.emailVerifiedAt,
    this.password,
    this.phone,
    this.emailVerify,
    this.socialId,
    this.socialType,
    this.status,
    this.image,
    this.address,
    this.location,
    this.storeName,
    this.verifyEmailToken,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        fName = json['f_name'] as String?,
        lName = json['l_name'] as String?,
        email = json['email'] as String?,
        emailVerifiedAt = json['email_verified_at'],
        password = json['password'] as String?,
        phone = json['phone'] as String?,
        emailVerify = json['email_verify'],
        socialId = json['social_id'],
        socialType = json['social_type'],
        status = json['status'] as String?,
        image = json['image'] as String?,
        address = json['address'] as String?,
        location = json['location'] as String?,
        storeName = json['store_name'],
        verifyEmailToken = json['verify_email_token'] as String?,
        rememberToken = json['remember_token'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'f_name': fName,
        'l_name': lName,
        'email': email,
        'email_verified_at': emailVerifiedAt,
        'password': password,
        'phone': phone,
        'email_verify': emailVerify,
        'social_id': socialId,
        'social_type': socialType,
        'status': status,
        'image': image,
        'address': address,
        'location': location,
        'store_name': storeName,
        'verify_email_token': verifyEmailToken,
        'remember_token': rememberToken,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}

class Bookings {
  final int? id;
  final String? vendorId;
  final String? userId;
  final String? serviceId;
  final String? bookingDate;
  final String? timeFrom;
  final String? timeTo;
  final String? status;
  final String? addons;
  final dynamic location;
  final dynamic createdAt;
  final dynamic updatedAt;
  final List<ServiceAddons>? serviceAddons;

  Bookings({
    this.id,
    this.vendorId,
    this.userId,
    this.serviceId,
    this.bookingDate,
    this.timeFrom,
    this.timeTo,
    this.status,
    this.addons,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.serviceAddons,
  });

  Bookings.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        vendorId = json['vendor_id'] as String?,
        userId = json['user_id'] as String?,
        serviceId = json['service_id'] as String?,
        bookingDate = json['booking_date'] as String?,
        timeFrom = json['time_from'] as String?,
        timeTo = json['time_to'] as String?,
        status = json['status'] as String?,
        addons = json['addons'] as String?,
        location = json['location'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        serviceAddons = (json['service_addons'] as List?)
            ?.map((dynamic e) =>
                ServiceAddons.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'vendor_id': vendorId,
        'user_id': userId,
        'service_id': serviceId,
        'booking_date': bookingDate,
        'time_from': timeFrom,
        'time_to': timeTo,
        'status': status,
        'addons': addons,
        'location': location,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'service_addons': serviceAddons?.map((e) => e.toJson()).toList()
      };
}

class ServiceAddons {
  final int? id;
  final String? serviceId;
  final String? title;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  ServiceAddons({
    this.id,
    this.serviceId,
    this.title,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  ServiceAddons.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        serviceId = json['service_id'] as String?,
        title = json['title'] as String?,
        image = json['image'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'service_id': serviceId,
        'title': title,
        'image': image,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}

class Service {
  final String? id;
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
  });

  Service.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
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
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title_en': titleEn,
        'cover_image': coverImage,
        'title_arabic': titleArabic,
        'description_arabic': descriptionArabic,
        'description_en': descriptionEn,
        'address': address,
        'mobile_number': mobileNumber,
        'city': city,
        'cat_id': catId,
        'parent_id': parentId,
        'amount': amount,
        'vendor_id': vendorId,
        'rating': rating,
        'capicity': capicity,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
