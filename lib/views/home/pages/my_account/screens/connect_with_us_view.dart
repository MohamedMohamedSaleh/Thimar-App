import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_form_input.dart';

class ConnectWithUsView extends StatelessWidget {
  const ConnectWithUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'تواصل معنا'),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Stack(
                  children: [
                    const ClipRRect(
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(15)),
                      child: AppImage(
                        'assets/icon/svg/account/maps.svg',
                        fit: BoxFit.cover,
                        height: 190,
                      ),
                    ),
                    const Positioned(
                      top: 47,
                      right: 75,
                      child: AppImage(
                        'assets/icon/svg/account/mark.svg',
                        height: 25,
                      ),
                    ),
                    Positioned(
                      top: 130,
                      right: 24,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 6),
                              blurRadius: 17,
                              color: Colors.black.withOpacity(0.04),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    AppImage(
                                      'assets/icon/svg/account/Location_Calling.svg',
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      'شارع الملك فهد , جدة , المملكة العربية السعودية13',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff091022)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    AppImage(
                                      'assets/icon/svg/account/Calling.svg',
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      '+966 054 87452',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff091022)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    AppImage(
                                      'assets/icon/svg/account/Message.svg',
                                      height: 12,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      'info@thimar.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff091022)),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'أو يمكنك إرسال رسالة ',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadiusDirectional.all(
                          Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 17,
                          color: Colors.black.withOpacity(0.04),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                          child: CustomFormInput(
                            labelText: 'الإسم',
                            isFillColor: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 50,
                          child: CustomFormInput(
                            labelText: 'رقم الموبايل',
                            isFillColor: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 78,
                          child: CustomFormInput(
                            labelText: 'الموضوع',
                            isFillColor: false,
                            maxLines: 3,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: CustomFillButton(
                                title: 'إرسال', onPress: () {}))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
