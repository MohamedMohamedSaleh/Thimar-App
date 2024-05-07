import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
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
      appBar: const CustomAppBar(title: 'الأقتراحات والشكاوي'),
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
                  labelText: 'الإسم'),
              const SizedBox(
                height: 10,
              ),
              CustomFormInput(
                controller: bloc.phone,
                isFillColor: false,
                labelText: 'رقم الموبايل',
                isPhone: true,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormInput(
                controller: bloc.content,
                isFillColor: false,
                labelText: 'الموضوع',
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
                      title: 'إرسال',
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
