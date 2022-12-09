class UserDataResponseModel {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  UserDataResponseModel(
      {this.statusCode, this.status, this.message, this.data});

  UserDataResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? fullName;
  String? email;
  String? profileImage;
  int? role;
  int? status;
  int? emailVerificationOtp;
  String? phoneNumber;
  String? isoCode;
  String? phoneCode;
  int? notification;
  Null? emailNotification;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? authToken;

  Data(
      {this.id,
        this.fullName,
        this.email,
        this.profileImage,
        this.role,
        this.status,
        this.emailVerificationOtp,
        this.phoneNumber,
        this.isoCode,
        this.phoneCode,
        this.notification,
        this.emailNotification,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.authToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    profileImage = json['profile_image'];
    role = json['role'];
    status = json['status'];
    emailVerificationOtp = json['email_verification_otp'];
    phoneNumber = json['phone_number'];
    isoCode = json['iso_code'];
    phoneCode = json['phone_code'];
    notification = json['notification'];
    emailNotification = json['email_notification'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    data['role'] = this.role;
    data['status'] = this.status;
    data['email_verification_otp'] = this.emailVerificationOtp;
    data['phone_number'] = this.phoneNumber;
    data['iso_code'] = this.isoCode;
    data['phone_code'] = this.phoneCode;
    data['notification'] = this.notification;
    data['email_notification'] = this.emailNotification;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['auth_token'] = this.authToken;
    return data;
  }
}