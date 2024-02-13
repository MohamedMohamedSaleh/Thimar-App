import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/views/home/basket_and_orders/widget/custom_orders_mony.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/add_title_view.dart';
import 'package:vegetable_orders_project/views/sheets/finish_order_sheet.dart';
import 'package:vegetable_orders_project/views/sheets/titles_sheet.dart';

import '../../../core/widgets/custom_fill_button.dart';
import '../../sheets/thank_you_sheet.dart';

class CompletOrderView extends StatelessWidget {
  const CompletOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0.0;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'إتمام الطلب',
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'الإسم : محمد',
              style: _textStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'الجوال : 05068285914',
              style: _textStyle,
            ),
            const SizedBox(
              height: 34,
            ),
            Row(
              children: [
                const Text(
                  'اختر عنوان التوصيل',
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
            InkWell(
              onTap: () {
                showModalBottomSheet(
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
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: mainColor,
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        'المنزل : 119 طريق الملك عبدالعزيز',
                        style: _textStyle.copyWith(fontWeight: FontWeight.w500),
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
            const SizedBox(
              height: 32,
            ),
            const Text(
              'تحديد وقت التوصيل',
              style: _textStyle,
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: mainColor.withOpacity(0.1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 19),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'اختر اليوم والتاريخ',
                            style: _textStyle.copyWith(
                              fontSize: 15,
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
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: mainColor.withOpacity(0.1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 19),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'اختر الوقت',
                            style: _textStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
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
              ],
            ),
            const SizedBox(
              height: 21,
            ),
            const Text(
              'ملاحظات وتعليمات',
              style: _textStyle,
            ),
            TextField(
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
            const Text(
              'اختر طريقة الدفع',
              style: _textStyle,
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(color: mainColor),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 11),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppImage('assets/icon/svg/money.svg'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'كاش',
                                      style: _textStyle,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              clipBehavior: Clip.antiAlias,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(28),
                                  topRight: Radius.circular(28),
                                ),
                              ),
                              context: context,
                              builder: (context) => const FinishOrderSheet(),
                            );
                          },
                          child: SizedBox(
                            height: 48,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(
                                  color: mainColor.withOpacity(.1),
                                ),
                              ),
                              child: const AppImage('assets/icon/svg/visa.svg'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              clipBehavior: Clip.antiAlias,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(28),
                                  topRight: Radius.circular(28),
                                ),
                              ),
                              context: context,
                              builder: (context) => const FinishOrderSheet(),
                            );
                          },
                          child: SizedBox(
                            height: 48,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(
                                  color: mainColor.withOpacity(.1),
                                ),
                              ),
                              child: const AppImage(
                                  'assets/icon/svg/mostercard.svg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'ملخص الطلب',
              style: _textStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomOrdersMony(
              isCompletOrder: true,
            ),
            isKeyboardOpen
                ? const SizedBox()
                : const SizedBox(
                    height: 75,
                  ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: ColoredBox(
        color: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 16, bottom: 20, top: 5, left: 16),
            child: SizedBox(
              width: double.infinity,
              child: CustomFillButton(
                title: 'إنهاء الطلب',
                onPress: () {
                  showModalBottomSheet(
                    clipBehavior: Clip.antiAlias,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    context: context,
                    builder: (context) => const ThankYouSheet(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const TextStyle _textStyle =
    TextStyle(color: mainColor, fontSize: 16, fontWeight: FontWeight.bold);
