import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/features/cart/cart_bloc.dart';
import 'package:vegetable_orders_project/features/get_location.dart';
import 'package:vegetable_orders_project/features/my_orders/get_my_orders/my_orders_bloc.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/cart_and_orders/widget/custom_orders_mony.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/add_title_view.dart';
import 'package:vegetable_orders_project/views/sheets/titles_sheet.dart';
import '../../../core/widgets/custom_fill_button.dart';
import '../../../features/addresses/addresses_model.dart';

class CompletOrderView extends StatefulWidget {
  const CompletOrderView({super.key});

  @override
  State<CompletOrderView> createState() => _CompletOrderViewState();
}

class _CompletOrderViewState extends State<CompletOrderView> {
  final bloc = KiwiContainer().resolve<MyOrdersBloc>();
  AddressModel? model;
  bool isKash = true;
  bool isCards = false;
  bool isWallet = false;
  DateTime? datePicker;
  TimeOfDay? timePicker;
  String? time;
  @override
  Widget build(BuildContext context) {
    isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0.0;
    return ColoredBox(
      color: Colors.white,
      child: FadeIn(
        duration: const Duration(milliseconds: 500),
        child: Scaffold(
          appBar: CustomAppBar(
            title: LocaleKeys.complete_order_complete_order.tr(),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    '${LocaleKeys.charge_now_name.tr()} : ${CacheHelper.getUserName()}',
                    style: _textStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${LocaleKeys.complete_order_phone.tr()} : ${CacheHelper.getUserPhone()}',
                    style: _textStyle,
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Row(
                    children: [
                      Text(
                        LocaleKeys.complete_order_choose_the_delivery_address
                            .tr(),
                        style: _textStyle,
                      ),
                      const Spacer(),
                      CustomAppBarIcon(
                        onTap: () => navigateTo(toPage: const AddTitleView()),
                        isBack: false,
                        height: 25,
                        width: 25,
                        child: Icon(
                          Icons.add_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) => InkWell(
                      onTap: () async {
                        model = await showModalBottomSheet(
                          clipBehavior: Clip.antiAlias,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                            ),
                          ),
                          context: context,
                          builder: (context) => const TitlesSheet(),
                        );
                        if (model?.location.isNotEmpty ?? false) {
                          // TODO: this is operation to delete some string
                          final list = model!.location.split(' ');
                          list.removeAt(0);
                          String location = list.join(' ');

                          CacheHelper.setCurrentLocation(location);
                          // CacheHelper.setCurrentLocation(model!.location);
                          GetLocationn.controller.add(true);
                        }
                        bloc.addressId = model?.id.toString();
                        if (model != null) {
                          setState(
                            () {},
                          );
                        }
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: mainColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 8),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 230.w,
                                child: Text(
                                  CacheHelper.getCurrentLocation() ??
                                      (context.locale.languageCode == "en"
                                          ? "Select address"
                                          : "اختر عنوان"),
                                  style: _textStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: mainColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    LocaleKeys.complete_order_delivery_time.tr(),
                    style: _textStyle,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            datePicker = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025),
                            );
                            setState(() {});
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: mainColor.withOpacity(0.1),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    datePicker == null
                                        ? LocaleKeys
                                            .complete_order_choose_date_and_day
                                            .tr()
                                        : datePicker.toString().split(" ")[0],
                                    style: _textStyle.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Spacer(),
                                  const AppImage('assets/icon/svg/date.svg'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            timePicker = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            setState(() {});
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: mainColor.withOpacity(0.1),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    timePicker == null
                                        ? LocaleKeys.complete_order_choose_time
                                            .tr()
                                        : " ${timePicker?.minute.toString()} : ${timePicker?.hour.toString()}",
                                    style: _textStyle.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                  const Spacer(),
                                  const AppImage('assets/icon/svg/time.svg'),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Text(
                    LocaleKeys.complete_order_notes_and_instructions.tr(),
                    style: _textStyle,
                  ),
                  TextField(
                    controller: bloc.note,
                    maxLines: 3,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                          color: mainColor.withOpacity(.1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.5,
                  ),
                  Text(
                    LocaleKeys.complete_order_choose_payment_way.tr(),
                    style: _textStyle,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) => Row(
                      children: [
                        _CustomPayWay(
                          onTap: () {
                            isKash = true;
                            isCards = false;
                            isWallet = false;
                            setState(
                              () {},
                            );
                          },
                          isTrue: isKash,
                          imagePath: 'assets/icon/svg/money.svg',
                          title: LocaleKeys.complete_order_cash.tr(),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        _CustomPayWay(
                          onTap: () {
                            isKash = false;
                            isCards = true;
                            isWallet = false;
                            setState(
                              () {},
                            );
                          },
                          isCard: true,
                          fontSize: isCards ? 11 : 10,
                          isTrue: isCards,
                          imagePath: 'assets/images/card_payments.png',
                          title: context.locale.languageCode == "en"
                              ? "Credit Cart"
                              : 'بطاقات الدفع',
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        _CustomPayWay(
                          onTap: () {
                            isKash = false;
                            isCards = false;
                            isWallet = true;
                            setState(
                              () {},
                            );
                          },
                          isTrue: isWallet,
                          imagePath: 'assets/icon/svg/account/Wallet.svg',
                          title: LocaleKeys.my_account_wallet.tr(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    LocaleKeys.orders_order_summary.tr(),
                    style: _textStyle,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  KiwiContainer().resolve<CartBloc>().cartData!.isVip == 1
                      ? Text(
                          KiwiContainer()
                              .resolve<CartBloc>()
                              .cartData!
                              .vipMessage,
                          style:
                              TextStyle(fontSize: 13.sp, color: Colors.orange),
                          textAlign: TextAlign.center,
                        )
                      : SizedBox(
                          height: 4.h,
                        ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomOrdersMony(
                    model: KiwiContainer().resolve<CartBloc>().cartData!,
                    isCompletOrder: true,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is AddOrderLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CustomFillButton(
                        title: LocaleKeys.complete_order_finish_order.tr(),
                        onPress: () {
                          bloc.add(
                            AddOrderEvent(
                              date: datePicker.toString().split(" ")[0],
                              time:
                                  "${timePicker?.hour.toString()}:${timePicker?.minute.toString()}"
                                      .trim(),
                              payType: isWallet
                                  ? 'wallet'
                                  : isCards
                                      ? 'card'
                                      : 'cash',
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ),
          // extendBody: true,
        ),
      ),
    );
  }
}

const TextStyle _textStyle =
    TextStyle(color: mainColor, fontSize: 14, fontWeight: FontWeight.bold);

class _CustomPayWay extends StatefulWidget {
  const _CustomPayWay({
    this.isTrue = true,
    required this.imagePath,
    required this.title,
    this.fontSize = 16,
    required this.onTap,
    this.isCard = false,
  });
  final bool isTrue;
  final bool isCard;
  final String imagePath;
  final String title;
  final int fontSize;
  final void Function() onTap;
  @override
  State<_CustomPayWay> createState() => __CustomPayWayState();
}

class __CustomPayWayState extends State<_CustomPayWay> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox(
          height: 48.h,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
              border:
                  Border.all(width: widget.isTrue ? 3 : 1, color: mainColor),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 4.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppImage(
                      widget.imagePath,
                      height: widget.isTrue ? 16.h : 14,
                    ),
                    Flexible(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: widget.isTrue
                                ? widget.fontSize.sp
                                : widget.isCard
                                    ? 9
                                    : 12.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
