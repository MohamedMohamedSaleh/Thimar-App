import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';

class FiltterSheet extends StatelessWidget {
  const FiltterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 8),
      child: ListView(
        children: [
          const Center(
            child: Text(
              'تصفية',
              style: TextStyle(
                color: mainColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 10),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'السعر',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const _CustomSliderPrice(),
          const Divider(),
          const Text(
            'الترتيب',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          const _CustomCheckPrice(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: double.infinity,
              child: CustomFillButton(title: 'تطبيق', onPress: () {}))
        ],
      ),
    );
  }
}

class _CustomSliderPrice extends StatefulWidget {
  const _CustomSliderPrice();

  @override
  State<_CustomSliderPrice> createState() => __CustomSliderPriceState();
}

class __CustomSliderPriceState extends State<_CustomSliderPrice> {
  RangeValues values = const RangeValues(500, 1500);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels('${values.start.ceil()} ر.س', '${values.end.ceil()} ر.س');
    return Column(
      children: [
        SliderTheme(
          data: SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
            valueIndicatorShape: SliderComponentShape.noOverlay,
            valueIndicatorColor: mainColor,
            thumbColor: Colors.white,
          ),
          child: RangeSlider(
            max: 2000,
            min: 0,
            labels: labels,
            divisions: 100,
            values: values,
            onChanged: (newValues) {
              values = newValues;
              setState(() {});
            },
          ),
        ),
        const SizedBox(
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              const Text(
                'من:',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '${values.start.ceil()}ر.س',
                style: const TextStyle(
                  color: mainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              const Text(
                'إلى:',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '${values.end.ceil()}ر.س',
                style: const TextStyle(
                  color: mainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CustomCheckPrice extends StatefulWidget {
  const _CustomCheckPrice();

  @override
  State<_CustomCheckPrice> createState() => __CustomCheckPriceState();
}

class __CustomCheckPriceState extends State<_CustomCheckPrice> {
  bool fromTop = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -2,
                ),
                activeColor: mainColor,
                side: BorderSide(width: 1, color: mainColor.withOpacity(.5)),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(5)),
                value: !fromTop,
                onChanged: (value) {
                  fromTop = false;
                  setState(() {});
                },
              ),
            ),
            const Text(
              'من السعر الأقل للأعلي',
              style: TextStyle(
                  color: mainColor, fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        // SizedBox(height: 10,),
        Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                visualDensity: const VisualDensity(
                  horizontal: -4.0,
                  vertical: -3.0,
                ),
                activeColor: mainColor,
                side: BorderSide(width: 1, color: mainColor.withOpacity(.5)),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(5)),
                value: fromTop,
                onChanged: (value) {
                  fromTop = true;
                  setState(() {});
                },
              ),
            ),
            const Text(
              'من السعر الأعلى للأقل',
              style: TextStyle(
                  color: mainColor, fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
