import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/features/addresses/addresses_model.dart';
import 'package:vegetable_orders_project/features/addresses/get_delete_addresses/get_delete_addresses_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/add_title_view.dart';

class TitleItem extends StatefulWidget {
  const TitleItem({super.key, required this.model});
  final AddressModel model;

  @override
  State<TitleItem> createState() => _TitleItemState();
}

class _TitleItemState extends State<TitleItem> {
  final bloc = KiwiContainer().resolve<GetDeleteAddressesBloc>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 17,
              color: Colors.black.withOpacity(0.03),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: mainColor,
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 13, bottom: 10, top: 8),
          child: Row(
            // crossAxisAlignment: WrapCrossAlignment.start,
            // direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.type == 'home' ? 'المنزل' : 'العمل',
                      style: const TextStyle(
                        color: mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'العنوان : ${widget.model.location}',
                      style: const TextStyle(
                        color: mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'الوصف: ${widget.model.description}',
                      style: const TextStyle(
                        color: Color(0xff999797),
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'رقم الجوال: ${widget.model.phone}',
                      style: const TextStyle(
                        color: Color(0xff999797),
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Row(
                    children: [
                      BlocBuilder(
                        bloc: bloc,
                        builder: (context, state) {
                          if (state is DeleteAddressesLoadingState &&
                              state.id == widget.model.id) {
                            return const Center(
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                  )),
                            );
                          }
                          return CustomAppBarIcon(
                            onTap: () {
                              bloc.add(
                                  DeleteAddressesEvent(id: widget.model.id));
                            },
                            height: 24,
                            width: 24,
                            isBack: false,
                            color: const Color(0xffFFD4D4),
                            child: const AppImage(
                              'assets/icon/svg/Trash.svg',
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomAppBarIcon(
                        onTap: () {
                          CacheHelper.removeLocation();
                          navigateTo(
                            toPage: AddTitleView(
                              isAddTitle: false,
                              description: widget.model.description,
                              phone: widget.model.phone,
                              type: widget.model.type,
                              lat: widget.model.lat,
                              lng: widget.model.lng,
                              id: widget.model.id,
                            ),
                          );
                        },
                        isBack: false,
                        height: 24,
                        width: 24,
                        child:
                            const AppImage('assets/icon/svg/account/Edit2.svg'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
