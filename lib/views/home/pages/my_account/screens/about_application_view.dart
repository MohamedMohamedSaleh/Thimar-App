import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/policy_about_terms/policy_bloc.dart';

import '../../../../../core/constants/my_colors.dart';

class AboutApplicationView extends StatefulWidget {
  const AboutApplicationView({super.key});

  @override
  State<AboutApplicationView> createState() => _AboutApplicationViewState();
}

class _AboutApplicationViewState extends State<AboutApplicationView> {
  final bloc = KiwiContainer().resolve<PolicyBloc>()..add(GetAboutEvent());
  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.my_account_about_app.tr()),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is AboutLoadingState) {
            return const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                ),
              ),
            );
          } else if (state is AboutSuccessState) {
            var model = parse(state.model.about);
            String text = model.body!.text;
            return Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const AppImage(
                    'assets/images/vegetable_basket.png',
                    height: 140,
                    width: 142,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                        height: 2.1,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 66, 63, 63)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImage(
                    'assets/icon/no_data_category.png',
                    width: 200,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'لا توجد أسألة',
                    style: TextStyle(
                      fontSize: 25,
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
