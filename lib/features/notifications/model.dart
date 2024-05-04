class NotificationsData {

  late final Data data;

  late final String status;
  late final String message;
  
  NotificationsData.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);

    status = json['status'];
    message = json['message'];
  }


}

class Data {
 
  late final int unreadnotificationsCount;
  late final List<dynamic> notifications;
  
  Data.fromJson(Map<String, dynamic> json){
    unreadnotificationsCount = json['unreadnotifications_count'];
    notifications = List.castFrom<dynamic, dynamic>(json['notifications']);
  }

}






