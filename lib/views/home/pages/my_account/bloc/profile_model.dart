class ProfileData {
  late final UserDataProfile data;
  late final String status;
  late final String message;

  ProfileData.fromJson(Map<String, dynamic> json) {
    data = UserDataProfile.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class UserDataProfile {
  late final int id;
  late final String fullname;
  late final String phone;
  late final String image;
  late final City city;
  late final int isVip;
  UserDataProfile();
  UserDataProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    phone = json['phone'];
    image = json['image'];
    city = City.fromJson(json['city'] ?? {});
    isVip = json['is_vip'];
  }
}

class City {
  late final int? id;
  late final String? name;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
