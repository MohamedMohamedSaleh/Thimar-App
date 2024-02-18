import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/features/products/search_category/search_category_cubit.dart';

class FiltterSheet extends StatefulWidget {
  const FiltterSheet({super.key, required this.id});
  final int id;

  @override
  State<FiltterSheet> createState() => _FiltterSheetState();
}

class _FiltterSheetState extends State<FiltterSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 8),
      child: BlocProvider(
        create: (context) => GetSearchCategoryCubit(),
        child: BlocBuilder<GetSearchCategoryCubit, GetSearchCategryStates>(
          builder: (context, state) {
            final cubit = GetSearchCategoryCubit.get(context);
            return ListView(
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
                    child: CustomFillButton(
                        title: 'تطبيق',
                        onPress: () {
                          cubit.getSearch(id: widget.id);
                          Navigator.pop(context);
                        }))
              ],
            );
          },
        ),
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
  int maxPrice = 1500;
  int minPrice = 10;

  RangeValues values = const RangeValues(10, 1500);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels('${values.start.ceil()} ر.س', '${values.end.ceil()} ر.س');
    return BlocProvider(
      create: (context) => GetSearchCategoryCubit(),
      child: Builder(builder: (context) {
        final cubit = GetSearchCategoryCubit.get(context);

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
                  cubit.maxPrice = newValues.end.ceil();
                  cubit.minPrice = newValues.start.ceil();
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
      }),
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
    return BlocProvider(
      create: (context) => GetSearchCategoryCubit(),
      child: Builder(builder: (context) {
        final cubit = GetSearchCategoryCubit.get(context);
        if (fromTop) {
          cubit.filter = 'asc';
        } else {
          cubit.filter = 'dsc';
        }
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
                    side:
                        BorderSide(width: 1, color: mainColor.withOpacity(.5)),
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
                      color: mainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
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
                    side:
                        BorderSide(width: 1, color: mainColor.withOpacity(.5)),
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
                      color: mainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
