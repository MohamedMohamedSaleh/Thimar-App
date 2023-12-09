import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/views/home/notifications/notification_model.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<NotificationModel> list = [
    NotificationModel(
      title: "تم قبول طلبك وجاري تحضيره الأن",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
      time: "منذ ساعتان",
      details:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    ),
    NotificationModel(
      title: "تم قبول طلبك وجاري تحضيره الأن",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
      time: "منذ ساعتان",
      details:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    ),
    NotificationModel(
      title: "تم قبول طلبك وجاري تحضيره الأن",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
      time: "منذ ساعتان",
      details:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    ),
    NotificationModel(
      title: "تم قبول طلبك وجاري تحضيره الأن",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
      time: "منذ ساعتان",
      details:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    ),
    NotificationModel(
      title: "تم قبول طلبك وجاري تحضيره الأن",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
      time: "منذ ساعتان",
      details:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    ),
    NotificationModel(
      title: "تم قبول طلبك وجاري تحضيره الأن",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
      time: "منذ ساعتان",
      details:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    ),
    NotificationModel(
      title: "تم قبول طلبك وجاري تحضيره الأن",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
      time: "منذ ساعتان",
      details:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    ),
    NotificationModel(
      title: "تم قبول طلبك وجاري تحضيره الأن",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
      time: "منذ ساعتان",
      details:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    ),
    NotificationModel(
      title: "تم قبول طلبك وجاري تحضيره الأن",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
      time: "منذ ساعتان",
      details:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    ),
  ];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAppBar(
          title: "الإشعارات",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 26, right: 16),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(top: 22, bottom: 15),
                itemBuilder: (context, index) => _Item(model: list[index]),
                itemCount: list.length,
              ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.model});
  final NotificationModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 28,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 33,
            width: 33,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: const Color(0xff4C8613).withAlpha(13)),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Image.network(
                model.image,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  model.details,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff989898),
                  ),
                ),
                Text(
                  model.time,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff091022),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
