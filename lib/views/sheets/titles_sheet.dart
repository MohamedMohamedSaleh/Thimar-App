import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/add_title_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_outline_button.dart';

import '../../core/constants/my_colors.dart';
import '../home/pages/my_account/widgets/title_item.dart';

class TitlesSheet extends StatelessWidget {
  const TitlesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            'العناوين',
            style: TextStyle(
                color: mainColor, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => const TitleItem(),
          itemCount: 2,
        ),
        CustomOutlineButton(
            onTap: () {
              navigateTo(toPage: const AddTitleView());
            },
            title: 'إضافة عنوان جديد'),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
