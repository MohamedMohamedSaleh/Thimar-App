import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/features/products/products/products_bloc.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/main.dart';
import 'package:vegetable_orders_project/views/auth/logout/logout_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/about_application_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/connect_with_us_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/personal_data_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/privacy_policy_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/suggestions_complaints_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/terms_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/titles_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/wallet_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_my_data.dart';

import 'bloc/get_profile/profile_bloc.dart';
import 'screens/frequently_questions_view.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final bloc = KiwiContainer().resolve<LogoutBloc>();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SafeArea(
          child: Theme(
            data: ThemeData().copyWith(
              splashColor: Colors.transparent,
              primaryColor: mainColor,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: getMaterialColor(),
              ),
            ),
            child: ListView(
              // physics: const PageScrollPhysics(),
              addRepaintBoundaries: false,
              children: [
                const _CustomAppBarAccount(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                  child: Column(
                    children: [
                      DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xffF6F6F6),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => navigateTo(
                                      toPage: const PersonalDataView()),
                                  child: _ItemMyAccount(
                                    icon: 'account_details',
                                    title: LocaleKeys.my_account_personal_data
                                        .tr(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      navigateTo(toPage: const WalletView()),
                                  child: _ItemMyAccount(
                                    icon: 'Wallet',
                                    title: LocaleKeys.my_account_wallet.tr(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      navigateTo(toPage: const TitlesView()),
                                  child: _ItemMyAccount(
                                    icon: 'Location',
                                    title: LocaleKeys.my_account_addresses.tr(),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 18,
                      ),
                      DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xffF6F6F6),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => navigateTo(
                                      toPage: const FrequentlyQuestionsView()),
                                  child: _ItemMyAccount(
                                    icon: 'Questions',
                                    title: LocaleKeys.my_account_faqs.tr(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => navigateTo(
                                      toPage: const PrivacyPolicyView()),
                                  child: _ItemMyAccount(
                                    icon: 'privacy_policy',
                                    title: LocaleKeys.my_account_policy.tr(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => navigateTo(
                                      toPage: const ConnectWithUsView()),
                                  child: _ItemMyAccount(
                                    icon: 'Call_Calling',
                                    title: LocaleKeys.my_account_call_us.tr(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => navigateTo(
                                      toPage:
                                          const SuggestionsComplaintsView()),
                                  child: _ItemMyAccount(
                                    icon: 'Edit',
                                    title:
                                        LocaleKeys.my_account_complaints.tr(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    const url =
                                        'https://play.google.com/store/apps/details?id=com.alalmiya.thamra';
                                    await Share.share(
                                        'This app is very usefull.\n\n$url');
                                  },
                                  child: _ItemMyAccount(
                                    icon: 'share',
                                    title: LocaleKeys.my_account_share_app.tr(),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 18,
                      ),
                      DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xffF6F6F6),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => navigateTo(
                                      toPage: const AboutApplicationView()),
                                  child: _ItemMyAccount(
                                    icon: 'application',
                                    title: LocaleKeys.my_account_about_app.tr(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    String code =
                                        context.locale.languageCode == "en"
                                            ? "ar"
                                            : "en";
                                    await context.setLocale(Locale(code));
                                    setState(() {});

                                    KiwiContainer()
                                        .resolve<ProfileBloc>()
                                        .add(GetProfileEvent());
                                    KiwiContainer().resolve<ProductsBloc>()
                                      ..isTransitionFav = true
                                      ..isTransitionProduct = true;
                                  },
                                  child: _ItemMyAccount(
                                    icon: 'language',
                                    title: LocaleKeys.my_account_change_language
                                        .tr(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateTo(toPage: const TermsView());
                                  },
                                  child: _ItemMyAccount(
                                    icon: 'Note',
                                    title: LocaleKeys.my_account_terms.tr(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    const url =
                                        'https://play.google.com/store/apps/details?id=com.alalmiya.thamra';
                                    await Share.share(
                                        'This app is very usefull.\n\n$url');
                                  },
                                  child: _ItemMyAccount(
                                    icon: 'Star',
                                    title: LocaleKeys.my_account_rate_app.tr(),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 18,
                      ),
                      DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xffF6F6F6),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    bloc.add(LogoutEvent());
                                  },
                                  child: BlocBuilder(
                                    bloc: bloc,
                                    builder: (context, state) {
                                      if (state is LogoutLoading) {
                                        return const SizedBox(
                                          height: 45,
                                          width: double.infinity,
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }
                                      return _ItemMyAccount(
                                        title:
                                            LocaleKeys.my_account_log_out.tr(),
                                        icon: 'Turn_off',
                                        isLogout: true,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
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

class _ItemMyAccount extends StatelessWidget {
  const _ItemMyAccount(
      {required this.title, required this.icon, this.isLogout = false});
  final String title;
  final String icon;
  final bool isLogout;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          !isLogout
              ? AppImage(
                  'assets/icon/svg/account/$icon.svg',
                  height: 18,
                  width: 18,
                  fit: BoxFit.scaleDown,
                )
              : const SizedBox(),
          !isLogout
              ? const SizedBox(
                  width: 8,
                )
              : const SizedBox(),
          Text(
            title,
            style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Transform.flip(
            flipX: context.locale.languageCode == 'ar' ? false : true,
            child: AppImage(
              !isLogout
                  ? 'assets/icon/svg/line_arrow_acount.svg'
                  : 'assets/icon/svg/account/$icon.svg',
              height: 18,
              width: 18,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarAccount extends StatefulWidget
    implements PreferredSizeWidget {
  const _CustomAppBarAccount();

  @override
  State<_CustomAppBarAccount> createState() => _CustomAppBarAccountState();

  @override
  Size get preferredSize => const Size.fromHeight(210);
}

class _CustomAppBarAccountState extends State<_CustomAppBarAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        child: Stack(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 210,
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: true,
              title: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    LocaleKeys.my_account_my_account.tr(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomMyData(),
                ],
              ),
            ),
            Positioned(
              top: -55,
              right: -100,
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: -70,
              left: -110,
              child: CircleAvatar(
                radius: 105,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              bottom: -60,
              left: -80,
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              bottom: -40,
              right: -60,
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
