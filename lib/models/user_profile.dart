class UserProfile {
  final User? user;

  UserProfile({
    this.user,
  });

  UserProfile.fromJson(Map<String, dynamic> json)
      : user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'user': user?.toJson()};
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
