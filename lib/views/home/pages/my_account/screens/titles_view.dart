import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_outline_button.dart';

import '../widgets/title_item.dart';

class TitlesView extends StatelessWidget {
  const TitlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'العناوين',
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 26, right: 16, left: 16),
              itemBuilder: (context, index) => const TitleItem(),
              itemCount: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  CustomOutlineButton(onTap: () {}, title: 'إضافة عنوان'),
            ),
            const SizedBox(
              height: 32,
            ),

          ],
        ),
      ),
    );
  }
}
