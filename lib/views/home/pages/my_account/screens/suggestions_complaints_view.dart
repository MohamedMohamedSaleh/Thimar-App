import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_form_input.dart';

class SuggestionsComplaintsView extends StatelessWidget {
  const SuggestionsComplaintsView({super.key});

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
              const CustomFormInput(isFillColor: false ,labelText: 'الإسم'),
              const SizedBox(
                height: 10,
              ),
              const CustomFormInput(isFillColor: false ,labelText: 'رقم الموبايل'),
              const SizedBox(
                height: 10,
              ),
              const CustomFormInput(
                isFillColor: false ,labelText: 'الموضوع',
                maxLines: 3,
              ),
              const SizedBox(
                height: 22,
              ),
              CustomFillButton(title: 'إرسال', onPress: () {}),
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
