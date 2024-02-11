import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/about_application_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/personal_data_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/privacy_policy_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/suggestions_complaints_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/titles_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/wallet_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_my_data.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const _CustomAppBarAccount(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
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
                            onTap: () =>
                                navigateTo(toPage: const PersonalDataView()),
                            child: const _ItemMyAccount(
                              icon: 'account_details',
                              title: 'البيانات الشخصية',
                            ),
                          ),
                          InkWell(
                            onTap: () => navigateTo(toPage: const WalletView()),
                            child: const _ItemMyAccount(
                              icon: 'Wallet',
                              title: 'المحفظة',
                            ),
                          ),
                          InkWell(
                            onTap: () => navigateTo(toPage: const TitlesView()),
                            child: const _ItemMyAccount(
                              icon: 'Location',
                              title: 'العناوين',
                            ),
                          ),
                          const _ItemMyAccount(
                            icon: 'send_mony',
                            title: 'الدفع',
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
                          const _ItemMyAccount(
                            icon: 'Questions',
                            title: 'أسئلة متكررة',
                          ),
                          InkWell(
                            onTap: () =>
                                navigateTo(toPage: const PrivacyPolicyView()),
                            child: const _ItemMyAccount(
                              icon: 'privacy_policy',
                              title: 'سياسة الخصوصية',
                            ),
                          ),
                          const _ItemMyAccount(
                            icon: 'Call_Calling',
                            title: 'تواصل معنا',
                          ),
                          InkWell(
                            onTap: () => navigateTo(
                                toPage: const SuggestionsComplaintsView()),
                            child: const _ItemMyAccount(
                              icon: 'Edit',
                              title: 'الشكاوي والأقتراحات',
                            ),
                          ),
                          const _ItemMyAccount(
                            icon: 'share',
                            title: 'مشاركة التطبيق',
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
                          const _ItemMyAccount(
                            icon: 'Note',
                            title: 'الشروط والأحكام',
                          ),
                          const _ItemMyAccount(
                            icon: 'Star',
                            title: 'تقييم التطبيق',
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
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _ItemMyAccount(
                            title: 'تسجيل الخروج',
                            icon: 'Turn_off',
                            isLogout: true,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
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

class _CustomAppBarAccount extends StatelessWidget
    implements PreferredSizeWidget {
  const _CustomAppBarAccount();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        child: Stack(
          children: [
            AppBar(
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

  @override
  Size get preferredSize => const Size.fromHeight(210);
}
