import 'package:flutter/material.dart';

import '../../../../../core/logic/cache_helper.dart';
import '../../../../../core/logic/helper_methods.dart';
import '../../../../auth/login/login_view.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Image.asset(
                'assets/images/vegetable_basket.png',
                fit: BoxFit.scaleDown,
                height: 21,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                'سلة ثمار',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              Expanded(
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "التوصيل إلى",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: "شارع الملك فهد - جدة",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  CacheHelper.clear();
                  navegateReplace(toPage: const LoginView());
                },
                child: Badge(
                  offset: const Offset(5, -5),
                  alignment: AlignmentDirectional.topStart,
                  label: const Text(
                    "3",
                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Container(
                    height: 33,
                    width: 33,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(.13),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 20,
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

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
