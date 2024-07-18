import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/contact_us/contact_us_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_form_input.dart';

class ConnectWithUsView extends StatefulWidget {
  const ConnectWithUsView({super.key});

  @override
  State<ConnectWithUsView> createState() => _ConnectWithUsViewState();
}

class _ConnectWithUsViewState extends State<ConnectWithUsView> {
  final bloc = KiwiContainer().resolve<ContactUsBloc>();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.my_account_call_us.tr()),
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
              Text(
                LocaleKeys.contact_us_or_you_can_send_message.tr(),
                style: const TextStyle(
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
                        SizedBox(
                          height: 50,
                          child: CustomFormInput(
                            controller: bloc.nameController,
                            labelText: LocaleKeys.register_user_name.tr(),
                            isFillColor: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: CustomFormInput(
                            controller: bloc.phoneController,
                            labelText: LocaleKeys.log_in_phone_number.tr(),
                            isFillColor: false,
                            isPhone: true,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 78,
                          child: CustomFormInput(
                            controller: bloc.contentController,
                            labelText: LocaleKeys.contact_us_subject.tr(),
                            isFillColor: false,
                            maxLines: 3,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        BlocBuilder(
                          bloc: bloc,
                          builder: (context, state) {
                            if (state is ContactUsLoading) {
                              return const SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(),
                              );
                            }
                            return SizedBox(
                                width: double.infinity,
                                child: CustomFillButton(
                                    title: LocaleKeys.contact_us_send.tr(),
                                    onPress: () {
                                      FocusScope.of(context).unfocus();

                                      bloc.add(ContactUsEvent());
                                    }));
                          },
                        )
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
