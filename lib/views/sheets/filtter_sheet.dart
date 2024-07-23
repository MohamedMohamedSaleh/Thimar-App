import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/features/products/search_category/search_category_bloc.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';

class FiltterSheet extends StatefulWidget {
  const FiltterSheet(
      {super.key, required this.id, required this.bloc, this.value = ''});
  final int id;
  final GetSearchCategoryBloc bloc;
  final String value;

  @override
  State<FiltterSheet> createState() => _FiltterSheetState();
}

class _FiltterSheetState extends State<FiltterSheet> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.of(context).pop();
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 8).r,
        child: ListView(
          children: [
            Center(
              child: Text(
                LocaleKeys.categories_filter.tr(),
                style: TextStyle(
                  color: mainColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(height: 10.h),
            SizedBox(
              height: 4.h,
            ),
            Text(
              LocaleKeys.price.tr(),
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            _CustomSliderPrice(
              bloc: widget.bloc,
            ),
            const Divider(),
            Text(
              LocaleKeys.categories_sort.tr(),
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.h,
            ),
            _CustomCheckPrice(
              bloc: widget.bloc,
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomFillButton(
                title: LocaleKeys.categories_apply.tr(),
                onPress: () {
                  widget.bloc.add(GetSearchCategoryEvent(
                      id: widget.id, value: widget.value));
                  Navigator.pop(context);
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomSliderPrice extends StatefulWidget {
  const _CustomSliderPrice({required this.bloc});
  final GetSearchCategoryBloc bloc;
  @override
  State<_CustomSliderPrice> createState() => __CustomSliderPriceState();
}

class __CustomSliderPriceState extends State<_CustomSliderPrice> {
  late RangeValues values;

  @override
  void initState() {
    values = RangeValues(widget.bloc.minPrice, widget.bloc.maxPrice);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
        '${values.start.ceil()} ${LocaleKeys.r_s.tr()}',
        '${values.end.ceil()} ${LocaleKeys.r_s.tr()}');

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
            max: 1500,
            min: 1,
            labels: labels,
            divisions: 100,
            values: values,
            onChanged: (newValues) {
              values = newValues;
              setState(() {});
              widget.bloc.maxPrice = newValues.end.ceil().toDouble();
              widget.bloc.minPrice = newValues.start.ceil().toDouble();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              Text(
                context.locale.languageCode == 'ar' ? 'من:' : "From:",
                style: TextStyle(
                    color: mainColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '${values.start.ceil()} ${LocaleKeys.r_s.tr()}',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Text(
                context.locale.languageCode == 'ar' ? 'إلى:' : "To:",
                style: TextStyle(
                  color: mainColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '${values.end.ceil()} ${LocaleKeys.r_s.tr()}',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 15.sp,
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
  const _CustomCheckPrice({required this.bloc});
  final GetSearchCategoryBloc bloc;
  @override
  State<_CustomCheckPrice> createState() => __CustomCheckPriceState();
}

class __CustomCheckPriceState extends State<_CustomCheckPrice> {
  late bool fromTop;

  @override
  void initState() {
    fromTop = widget.bloc.filter == 'asc' ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (fromTop) {
      widget.bloc.filter = 'asc';
    } else {
      widget.bloc.filter = 'desc';
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
                side: BorderSide(width: 1, color: mainColor.withOpacity(.5)),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(5).w),
                value: !fromTop,
                onChanged: (value) {
                  fromTop = false;
                  setState(() {});
                },
              ),
            ),
            Text(
              LocaleKeys.categories_from_min_to_high.tr(),
              style: TextStyle(
                  color: mainColor,
                  fontSize: 15.sp,
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
                side: BorderSide(width: 1, color: mainColor.withOpacity(.5)),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(5).w),
                value: fromTop,
                onChanged: (value) {
                  fromTop = true;
                  setState(() {});
                },
              ),
            ),
            Text(
              LocaleKeys.categories_from_high_to_min.tr(),
              style: TextStyle(
                  color: mainColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
