class UserRequestModel {
  UserRequestModel(
      {this.email,
        this.password,
        this.deviceType,
        this.sellerType,
        this.fullName,
        this.phoneCode,
        this.isoCode,
        this.phoneNumber,
      });

  String? email;
  String? password;
  int? deviceType;
  int? sellerType;
  String? fullName;
  String? phoneCode;
  String? isoCode;
  String? phoneNumber;

  factory UserRequestModel.fromJson(Map<String, dynamic> json) =>
      UserRequestModel(
        email: json["email"],
        password: json["password"],
        deviceType: json["device_type"],
        sellerType: json["seller_type"],
        fullName: json["full_name"],
        isoCode: json["iso_code"],
        phoneNumber: json["phone_number"],
        phoneCode: json["phone_code"],
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "email": email,
      "password": password,
      "device_type": deviceType,
      "seller_type": sellerType,
      "full_name": fullName,
      "iso_code": isoCode,
      "phone_code": phoneCode,
      "phone_number": phoneNumber,
    }..removeWhere((key, value) => value == null);
  }
}
