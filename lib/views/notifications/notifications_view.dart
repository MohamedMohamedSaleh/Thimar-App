import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الإشعارات"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 26, right: 16),
        child: ListView(
          padding: const EdgeInsets.only(top: 30, bottom: 15),
          children: const [
            _Item(
              title: "تم قبول طلبك وجاري تحضيره الأن",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
              time: "منذ ساعتان",
              supTitle:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
            ),
            _Item(
              title: "تم قبول طلبك وجاري تحضيره الأن",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
              time: "منذ ساعتان",
              supTitle:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
            ),
            _Item(
              title: "تم قبول طلبك وجاري تحضيره الأن",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
              time: "منذ ساعتان",
              supTitle:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
            ),
            _Item(
              title: "تم قبول طلبك وجاري تحضيره الأن",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
              time: "منذ ساعتان",
              supTitle:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
            ),
            _Item(
              title: "تم قبول طلبك وجاري تحضيره الأن",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
              time: "منذ ساعتان",
              supTitle:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
            ),
            _Item(
              title: "تم قبول طلبك وجاري تحضيره الأن",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
              time: "منذ ساعتان",
              supTitle:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
            ),
            _Item(
              title: "تم قبول طلبك وجاري تحضيره الأن",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
              time: "منذ ساعتان",
              supTitle:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
            ),
            _Item(
              title: "تم قبول طلبك وجاري تحضيره الأن",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
              time: "منذ ساعتان",
              supTitle:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
            ),
            _Item(
              title: "تم قبول طلبك وجاري تحضيره الأن",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Google_Messages_logo.svg/2500px-Google_Messages_logo.svg.png",
              time: "منذ ساعتان",
              supTitle:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.image,
    required this.title,
    required this.supTitle,
    required this.time,
  });
  final String image;
  final String title;
  final String supTitle;
  final String time;
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
                image,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  supTitle,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff989898),
                  ),
                ),
                Text(
                  time,
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
