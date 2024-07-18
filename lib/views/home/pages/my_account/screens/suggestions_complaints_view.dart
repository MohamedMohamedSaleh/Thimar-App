import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/suggestions/suggestions_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_form_input.dart';

class SuggestionsComplaintsView extends StatefulWidget {
  const SuggestionsComplaintsView({super.key});

  @override
  State<SuggestionsComplaintsView> createState() =>
      _SuggestionsComplaintsViewState();
}

class _SuggestionsComplaintsViewState extends State<SuggestionsComplaintsView> {
  final bloc = KiwiContainer().resolve<SuggestionsBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.my_account_complaints.tr()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: const EdgeInsets.only(top: 50),
            children: [
              CustomFormInput(
                  controller: bloc.name,
                  isFillColor: false,
                  labelText: LocaleKeys.register_user_name.tr()),
              const SizedBox(
                height: 10,
              ),
              CustomFormInput(
                controller: bloc.phone,
                isFillColor: false,
                labelText: LocaleKeys.log_in_phone_number.tr(),
                isPhone: true,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormInput(
                controller: bloc.content,
                isFillColor: false,
                labelText: LocaleKeys.contact_us_subject.tr(),
                maxLines: 3,
              ),
              const SizedBox(
                height: 22,
              ),
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is SentSuggestionsLoading) {
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
                  }
                  return CustomFillButton(
                      title: LocaleKeys.contact_us_send.tr(),
                      onPress: () {
                        FocusScope.of(context).unfocus();
                        bloc.add(SendSuggestionsEvent());
                      });
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
