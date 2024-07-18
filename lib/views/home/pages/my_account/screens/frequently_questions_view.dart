import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/questions/model.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/questions/questions_bloc.dart';

import '../../../../../core/widgets/app_image.dart';

class FrequentlyQuestionsView extends StatefulWidget {
  const FrequentlyQuestionsView({super.key});

  @override
  State<FrequentlyQuestionsView> createState() =>
      _FrequentlyQuestionsViewState();
}

class _FrequentlyQuestionsViewState extends State<FrequentlyQuestionsView> {
  final bloc = KiwiContainer().resolve<QuestionsBloc>()
    ..add(GetQuestionsEvent());
  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.my_account_faqs.tr(),
      ),
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is GetQuestionsLoading) {
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
            } else {
              if (state is GetQuestionsSuccess) {
                return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: ListView.builder(
                      itemCount: bloc.list.length,
                      itemBuilder: (context, index) => _CustomExpansionTile(
                        model: bloc.list[index],
                      ),
                    ));
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
            }
          }),
    );
  }
}

class _CustomExpansionTile extends StatefulWidget {
  const _CustomExpansionTile({required this.model});
  final QuestionModel model;
  @override
  State<_CustomExpansionTile> createState() => __CustomExpansionTileState();
}

class __CustomExpansionTileState extends State<_CustomExpansionTile> {
  bool _iconIsDown = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        widget.model.question,
        style: const TextStyle(
            color: mainColor, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      trailing: CustomAppBarIcon(
        isBack: false,
        height: 25,
        width: 25,
        child: Icon(
          !_iconIsDown
              ? Icons.keyboard_arrow_down_rounded
              : Icons.keyboard_arrow_up_rounded,
          color: mainColor,
        ),
      ),
      children: [
        Text(
          widget.model.answer,
          style: const TextStyle(
              color: Color(0xff828282),
              fontSize: 15,
              fontWeight: FontWeight.w300),
        ),
      ],
      onExpansionChanged: (value) {
        _iconIsDown = value;
        setState(() {});
      },
    );
  }
}
