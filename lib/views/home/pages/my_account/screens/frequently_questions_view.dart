import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';

class FrequentlyQuestionsView extends StatelessWidget {
  const FrequentlyQuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'أسئلة متكررة',
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: const [
            _CustomExpansionTile(
              title: 'كيفية الدفع عن طريق البطاقة الإئتمانيه؟',
              text:
                  """هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
      إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص  """,
            ),
            _CustomExpansionTile(
              title: 'كل ما تريد معرفته عن أكواد الخصم/ الكوبونات',
              text:
                  """ هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
      إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص """,
            ),
            _CustomExpansionTile(
              title: 'كيفية الدفع عن طريق البطاقة الإئتمانيه؟',
              text:
                  """ هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
      إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص """,
            ),
            _CustomExpansionTile(
              title: 'هل يتم وضع منتجات جديدة كل فترة؟',
              text:
                  """ هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
      إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص """,
            ),
            _CustomExpansionTile(
              title: 'ما هي الفترة الزمنية لتحديث المخزون لديكم؟',
              text:
                  """هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
      إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص  """,
            ),
            _CustomExpansionTile(
              title: 'لم أستلم منتج ما، ماذا أفعل؟',
              text:
                  """هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
      إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص  """,
            ),
            _CustomExpansionTile(
              title: 'كيفية الدفع عن طريق البطاقة الإئتمانيه؟',
              text:
                  """هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
      إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص  """,
            ),
            _CustomExpansionTile(
              title: 'كل ما تريد معرفته عن أكواد الخصم/ الكوبونات',
              text:
                  """هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
      إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص  """,
            ),
            _CustomExpansionTile(
              title: 'ما هي الفترة الزمنية لتحديث المخزون لديكم؟',
              text:
                  """هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
      إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص  """,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomExpansionTile extends StatefulWidget {
  const _CustomExpansionTile({
    required this.title,
    required this.text,
  });
  final String title;
  final String text;

  @override
  State<_CustomExpansionTile> createState() => __CustomExpansionTileState();
}

class __CustomExpansionTileState extends State<_CustomExpansionTile> {
  bool _iconIsDown = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        widget.title,
        style: const TextStyle(
            color: mainColor, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      trailing: CustomAppBarIcon(
        isBack: false,
        height: 25,
        width: 25,
        child: Icon(
          !_iconIsDown
              ? Icons.keyboard_arrow_down_rounded
              : Icons.keyboard_arrow_up_rounded,
          color: mainColor,
        ),
      ),
      children: [
        Text(
          widget.text,
          style: const TextStyle(
              color: Color(0xff828282),
              fontSize: 15,
              fontWeight: FontWeight.w300),
        ),
      ],
      onExpansionChanged: (value) {
        _iconIsDown = value;
        setState(() {});
      },
    );
  }
}
