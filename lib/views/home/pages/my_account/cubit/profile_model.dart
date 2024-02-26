class ProfileData {

  late final Data data;
  late final String status;
  late final String message;
  
  ProfileData.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }

}

class Data {
  
  late final int id;
  late final String fullname;
  late final String phone;
  late final String image;
  late final String city;
  late final int isVip;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fullname = json['fullname'];
    phone = json['phone'];
    image = json['image'];
    city = json['city']?? '';
    isVip = json['is_vip'];
  }

}