class WalletPaginatedData {
  late final List<Model> list;
  late final String status;
  late final String message;

  WalletPaginatedData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? []).map((e) => Model.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}

class Model {
  late final int id;
  late final String? amount;
  late final String beforeCharge;
  late final String afterCharge;
  late final String date;
  late final String statusTrans;
  late final String status;
  late final String transactionType;
  late final String modelType;
  late final int modelId;
  late final String state;
  late final List<ImagesPaginated> images;

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = double.tryParse(json['amount'].toString())?.toStringAsFixed(2);
    beforeCharge = (double.tryParse(json['before_charge'].toString()) ?? 0)
        .toStringAsFixed(2);
    afterCharge = (double.tryParse(json['after_charge'].toString()) ?? 0)
        .toStringAsFixed(2);
    date = json['date'];
    statusTrans = json['status_trans'];
    status = json['status'];
    transactionType = json['transaction_type'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    state = json['state'];
    images = List.from(json['images'] ?? [])
        .map((e) => ImagesPaginated.fromJson(e))
        .toList();
  }
}

class ImagesPaginated {
  late final String name;
  late final String url;

  ImagesPaginated.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
