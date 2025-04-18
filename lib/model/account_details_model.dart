import 'package:get/get.dart'; // Add GetX package

class AccountDetailsModel {
  bool? phoneNotifications;
  bool? smsNotifications;
  bool? postNotifications;
  bool? emailNotifications;
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? country;
  String? postalCode;
  String? city;
  String? address;
  String? mobile;
  String? dateOfBirth;
  bool? twoFactorEnabled;
  RxString? imageUrl = ''.obs;

  AccountDetailsModel(
      {this.phoneNotifications,
      this.smsNotifications,
      this.postNotifications,
      this.emailNotifications,
      this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.userName,
      this.country,
      this.postalCode,
      this.city,
      this.address,
      this.mobile,
      this.dateOfBirth,
      this.twoFactorEnabled,
      this.imageUrl})
      : super();

  AccountDetailsModel.fromJson(Map<String, dynamic> json) {
    phoneNotifications = json['phoneNotifications'] ?? false;
    smsNotifications = json['smsNotifications'];
    postNotifications = json['postNotifications'];
    emailNotifications = json['emailNotifications'];
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    country = json['country'];
    postalCode = json['postalCode'];
    city = json['city'];
    address = json['address'];
    mobile = json['mobile'];
    dateOfBirth = json['dateOfBirth'];
    twoFactorEnabled = json['twoFactorEnabled'];
    imageUrl?.value = json['imageUrl']; // Update reactive field
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNotifications'] = phoneNotifications;
    data['smsNotifications'] = smsNotifications;
    data['postNotifications'] = postNotifications;
    data['emailNotifications'] = emailNotifications;
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userName'] = userName;
    data['country'] = country;
    data['postalCode'] = postalCode;
    data['city'] = city;
    data['address'] = address;
    data['mobile'] = mobile;
    data['dateOfBirth'] = dateOfBirth;
    data['twoFactorEnabled'] = twoFactorEnabled;
    data['imageUrl'] = imageUrl?.value; // Update reactive field
    return data;
  }
}
