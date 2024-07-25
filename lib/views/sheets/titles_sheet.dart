import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/add_title_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_outline_button.dart';

import '../../core/constants/my_colors.dart';
import '../../core/widgets/app_image.dart';
import '../../features/addresses/get_delete_addresses/get_delete_addresses_bloc.dart';
import '../home/pages/my_account/widgets/custom_title_item.dart';

class TitlesSheet extends StatefulWidget {
  const TitlesSheet({super.key});

  @override
  State<TitlesSheet> createState() => _TitlesSheetState();
}

class _TitlesSheetState extends State<TitlesSheet> {
  final bloc = KiwiContainer().resolve<GetDeleteAddressesBloc>()
    ..add(GetAddressesEvent(isLoading: true));

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.pop(context);
        }
      },
      canPop: false,
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  LocaleKeys.my_account_addresses.tr(),
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is GetAddressesLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (bloc.list.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 70.0),
                            child: AppImage(
                              'assets/images/no_addresses.png',
                              // width: 200,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            LocaleKeys.home_data_not_found.tr(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pop(context, bloc.list[index]);
                          },
                          child: CustomTitleItem(model: bloc.list[index])),
                      itemCount: bloc.list.length,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomOutlineButton(
                  onTap: () {
                    navigateTo(toPage: const AddTitleView());
                  },
                  title: LocaleKeys.addresses_add_address.tr()),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
