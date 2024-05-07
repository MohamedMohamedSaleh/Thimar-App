class PolicyData {
  late final PolicyModel data;
  late final String status;
  late final String message;

  PolicyData.fromJson(Map<String, dynamic> json) {
    data = PolicyModel.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class PolicyModel {
  late final String policy;

  PolicyModel.fromJson(Map<String, dynamic> json) {
    policy = json['policy'];
  }
}

class AboutData {
  late final AboutModel data;
  late final String status;
  late final String message;

  AboutData.fromJson(Map<String, dynamic> json) {
    data = AboutModel.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class AboutModel {
  late final String about;

  AboutModel.fromJson(Map<String, dynamic> json) {
    about = json['about'];
  }
}
