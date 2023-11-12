class CitiesDataModel {
  late final List<CityModel> cityData;
  late final String status;
  late final String message;

  CitiesDataModel.fromJson(Map<String, dynamic> json) {
    cityData = List.from(json['data']).map((e) => CityModel.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}

class CityModel {
  late final String id;
  late final String name;

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
