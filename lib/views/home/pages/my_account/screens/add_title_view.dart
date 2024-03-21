import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_form_input.dart';

import '../widgets/custom_google_map.dart';

class AddTitleView extends StatefulWidget {
  const AddTitleView({super.key});

  @override
  State<AddTitleView> createState() => _AddTitleViewState();
}

class _AddTitleViewState extends State<AddTitleView> {
  bool isHome = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'إضافة عنوان'),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 30),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView(physics: const ClampingScrollPhysics(), children: [
              const SizedBox(
                height: 230,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomGoogleMap(),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 17,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 14, left: 14, top: 8, bottom: 8),
                    child: Row(
                      children: [
                        const Text(
                          'نوع العنوان',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff8B8B8B),
                          ),
                        ),
                        const Spacer(),
                        StatefulBuilder(
                          builder: (context, setState) => Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  isHome = true;
                                  setState(() {});
                                },
                                child: _typeOfTitle(
                                  fillColor: isHome ? mainColor : Colors.white,
                                  title: 'المنزل',
                                  titleColor: isHome
                                      ? Colors.white
                                      : const Color(0xff8B8B8B),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  isHome = false;
                                  setState(() {});
                                },
                                child: _typeOfTitle(
                                  fillColor: isHome ? Colors.white : mainColor,
                                  title: 'العمل',
                                  titleColor: !isHome
                                      ? Colors.white
                                      : const Color(0xff8B8B8B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 17)
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: const SizedBox(
                          height: 50,
                          child: CustomFormInput(
                            labelText: 'أدخل رقم الجوال',
                            isPhone: true,
                            isTitl: true,
                          )),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 17)
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: const SizedBox(
                          height: 50,
                          child: CustomFormInput(
                            labelText: 'الوصف',
                            isTitl: true,
                          )),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: CustomFillButton(
                            title: 'إضافة العنوان', onPress: () {}))
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

Widget _typeOfTitle(
    {required Color fillColor,
    required String title,
    required Color titleColor}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      border: Border.all(color: mainColor.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(9),
      color: fillColor,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            color: titleColor, fontSize: 15, fontWeight: FontWeight.w300),
      )),
    ),
  );
}
