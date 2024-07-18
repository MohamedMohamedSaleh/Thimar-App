class NotificationsData {

  late final Data data;

  late final String message;
  
  NotificationsData.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);

 
    message = json['message'];
  }


}

class Data {
  Data({
    required this.unreadnotificationsCount,
    required this.notifications,
  });
  late final int unreadnotificationsCount;
  late final List<Notifications> notifications;
  
  Data.fromJson(Map<String, dynamic> json){
    unreadnotificationsCount = json['unreadnotifications_count'];
    notifications = List.from(json['notifications']??[]).map((e)=>Notifications.fromJson(e)).toList();
  }


}

class Notifications {
  late final String id;
  late final String title;
  late final String body;
  late final String notifyType;
  late final String? offer;
  late final String? chat;
  late final String createdAt;
  late final String readAt;
  late final String? image;
  
  Notifications.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    body = json['body'];
    notifyType = json['notify_type'];
    offer = null;
    chat = null;
    createdAt = json['created_at'];
    readAt = json['read_at'];
    image = json['image'];
  }

}

