import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/main.dart';
import 'package:vegetable_orders_project/views/auth/login/login_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/about_application_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/connect_with_us_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/personal_data_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/privacy_policy_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/suggestions_complaints_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/terms_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/titles_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/wallet_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_my_data.dart';

import 'screens/frequently_questions_view.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

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
              physics: const PageScrollPhysics(),
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
                                  child: const _ItemMyAccount(
                                    icon: 'account_details',
                                    title: 'البيانات الشخصية',
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      navigateTo(toPage: const WalletView()),
                                  child: const _ItemMyAccount(
                                    icon: 'Wallet',
                                    title: 'المحفظة',
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      navigateTo(toPage: const TitlesView()),
                                  child: const _ItemMyAccount(
                                    icon: 'Location',
                                    title: 'العناوين',
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
                                  child: const _ItemMyAccount(
                                    icon: 'Questions',
                                    title: 'أسئلة متكررة',
                                  ),
                                ),
                                InkWell(
                                  onTap: () => navigateTo(
                                      toPage: const PrivacyPolicyView()),
                                  child: const _ItemMyAccount(
                                    icon: 'privacy_policy',
                                    title: 'سياسة الخصوصية',
                                  ),
                                ),
                                InkWell(
                                  onTap: () => navigateTo(
                                      toPage: const ConnectWithUsView()),
                                  child: const _ItemMyAccount(
                                    icon: 'Call_Calling',
                                    title: 'تواصل معنا',
                                  ),
                                ),
                                InkWell(
                                  onTap: () => navigateTo(
                                      toPage:
                                          const SuggestionsComplaintsView()),
                                  child: const _ItemMyAccount(
                                    icon: 'Edit',
                                    title: 'الشكاوي والأقتراحات',
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    const url =
                                        'https://play.google.com/store/apps/details?id=com.alalmiya.thamra';
                                    await Share.share(
                                        'This app is very usefull.\n\n$url');
                                  },
                                  child: const _ItemMyAccount(
                                    icon: 'share',
                                    title: 'مشاركة التطبيق',
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
                                  child: const _ItemMyAccount(
                                    icon: 'application',
                                    title: 'عن التطبيق',
                                  ),
                                ),
                                const _ItemMyAccount(
                                  icon: 'language',
                                  title: 'تغيير اللغة',
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateTo(toPage: const TermsView());
                                  },
                                  child: const _ItemMyAccount(
                                    icon: 'Note',
                                    title: 'الشروط والأحكام',
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    const url =
                                        'https://play.google.com/store/apps/details?id=com.alalmiya.thamra';
                                    await Share.share(
                                        'This app is very usefull.\n\n$url');
                                  },
                                  child: const _ItemMyAccount(
                                    icon: 'Star',
                                    title: 'تقييم التطبيق',
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
                                    CacheHelper.clearUserData();
                                    navigateTo(toPage: const LoginView());
                                  },
                                  child: const _ItemMyAccount(
                                    title: 'تسجيل الخروج',
                                    icon: 'Turn_off',
                                    isLogout: true,
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
          AppImage(
            !isLogout
                ? 'assets/icon/svg/line_arrow_acount.svg'
                : 'assets/icon/svg/account/$icon.svg',
            height: 18,
            width: 18,
            fit: BoxFit.scaleDown,
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
              title: const Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'حسابي',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomMyData(),
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
