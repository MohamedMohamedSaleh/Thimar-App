import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';

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
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _ItemMyAccount(
                            icon: 'account_details',
                            title: 'البيانات الشخصية',
                          ),
                          _ItemMyAccount(
                            icon: 'Wallet',
                            title: 'المحفظة',
                          ),
                          _ItemMyAccount(
                            icon: 'Location',
                            title: 'العناوين',
                          ),
                          _ItemMyAccount(
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
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _ItemMyAccount(
                            icon: 'Questions',
                            title: 'أسئلة متكررة',
                          ),
                          _ItemMyAccount(
                            icon: 'privacy_policy',
                            title: 'سياسة الخصوصية',
                          ),
                          _ItemMyAccount(
                            icon: 'Call_Calling',
                            title: 'تواصل معنا',
                          ),
                          _ItemMyAccount(
                            icon: 'Edit',
                            title: 'الشكاوي والأقتراحات',
                          ),
                          _ItemMyAccount(
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
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _ItemMyAccount(
                            icon: 'application',
                            title: 'عن التطبيق',
                          ),
                          _ItemMyAccount(
                            icon: 'language',
                            title: 'تغيير اللغة',
                          ),
                          _ItemMyAccount(
                            icon: 'Note',
                            title: 'الشروط والأحكام',
                          ),
                          _ItemMyAccount(
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
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: AppImage(
                      'https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg?size=626&ext=jpg&ga=GA1.1.1448711260.1706918400&semt=sph',
                      height: 70,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'محمد صالح',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '+96654787856',
                    style: TextStyle(
                      color: Color(0xffA2D273),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
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
