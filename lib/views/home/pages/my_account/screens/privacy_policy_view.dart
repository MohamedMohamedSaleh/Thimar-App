import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/policy_about_terms/policy_bloc.dart';

import '../../../../../core/widgets/app_image.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  final bloc = KiwiContainer().resolve<PolicyBloc>()..add(GetPolicyEvent());
  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.my_account_policy.tr()),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetPolicyLoading) {
            return const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  // backgroundColor: Colors.grey.withOpacity(.5),
                  strokeCap: StrokeCap.round,
                ),
              ),
            );
          } else if (state is GetPolicySuccess) {
            var model = parse(state.model.policy);
            String text = model.body!.text;
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
                children: [
                  const SizedBox(
                    height: 8,
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
                    height: 30,
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
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
