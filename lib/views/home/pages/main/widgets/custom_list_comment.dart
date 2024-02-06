import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';

class CustomListComments extends StatelessWidget {
  const CustomListComments({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        children: const [
          _ItemComment(),
          _ItemComment(),
          _ItemComment(),
        ],
      ),
    );
  }
}

class _ItemComment extends StatelessWidget {
  const _ItemComment();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff707070).withOpacity(0.05),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const SizedBox(
          width: 270,
          height: 85,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'محمد علي',
                          style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.orange,
                          size: 16,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.orange,
                          size: 16,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.orange,
                          size: 16,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.orange,
                          size: 16,
                        ),
                        Icon(
                          Icons.star_border_rounded,
                          color: Color(0xffD5D5D5),
                          size: 16,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 175,
                      child: Text(
                        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص ق.",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: AppImage(
                    'https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg?size=626&ext=jpg&ga=GA1.1.1448711260.1706918400&semt=sph',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
