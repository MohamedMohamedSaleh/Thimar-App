class AddressData {

  late final List<AddressModel> list;
  late final String status;
  late final String message;
  
  AddressData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']??[]).map((e)=>AddressModel.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}


class AddressModel {
  late final int id;
  late final String type;
  late final double lat;
  late final double lng;
  late final String location;
  late final String description;
  late final bool isDefault;
  late final String phone;
  
  AddressModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    type = json['type'];
    lat = json['lat'];
    lng = json['lng'];
    location = json['location'];
    description = json['description'];
    isDefault = json['is_default'];
    phone = json['phone'];
  }
}