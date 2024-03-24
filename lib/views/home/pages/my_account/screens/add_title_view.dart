import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/features/addresses/set_address/set_address_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_form_input.dart';

import '../widgets/custom_google_map.dart';

class AddTitleView extends StatefulWidget {
  const AddTitleView({
    super.key,
    this.isAddTitle = true,
    this.id,
    this.phone,
    this.description,
    this.lat,
    this.lng,
    this.type,
  });
  final bool isAddTitle;
  final int? id;
  final String? phone;
  final String? description;
  final String? type;
  final double? lat;
  final double? lng;

  @override
  State<AddTitleView> createState() => _AddTitleViewState();
}

class _AddTitleViewState extends State<AddTitleView> {
  final bloc = KiwiContainer().resolve<SetUpdateAdressBloc>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    !widget.isAddTitle ? phoneController.text = widget.phone! : null;
    !widget.isAddTitle
        ? descriptionController.text = widget.description!
        : null;
    widget.isAddTitle
        ? isHome = true
        : isHome = (widget.type! == 'home') ? true : false;
  }

  bool isHome = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: widget.isAddTitle ? 'إضافة عنوان' : 'تعديل عنوان'),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 30),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView(physics: const ClampingScrollPhysics(), children: [
              SizedBox(
                height: 230,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomGoogleMap(
                    isAddTitle: widget.isAddTitle,
                    lat: widget.lat,
                    lng: widget.lng,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 17,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 14, left: 14, top: 8, bottom: 8),
                    child: Row(
                      children: [
                        const Text(
                          'نوع العنوان',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff8B8B8B),
                          ),
                        ),
                        const Spacer(),
                        StatefulBuilder(
                          builder: (context, setState) => Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  isHome = true;
                                  setState(() {});
                                },
                                child: _typeOfTitle(
                                  fillColor: isHome ? mainColor : Colors.white,
                                  title: 'المنزل',
                                  titleColor: isHome
                                      ? Colors.white
                                      : const Color(0xff8B8B8B),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  isHome = false;
                                  setState(() {});
                                },
                                child: _typeOfTitle(
                                  fillColor: isHome ? Colors.white : mainColor,
                                  title: 'العمل',
                                  titleColor: !isHome
                                      ? Colors.white
                                      : const Color(0xff8B8B8B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 17)
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: SizedBox(
                          height: 50,
                          child: CustomFormInput(
                            controller: phoneController,
                            labelText: 'أدخل رقم الجوال',
                            isPhone: true,
                            isTitl: true,
                          )),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 17)
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: SizedBox(
                          height: 50,
                          child: CustomFormInput(
                            controller: descriptionController,
                            labelText: 'الوصف',
                            isTitl: true,
                          )),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    BlocBuilder(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is SetAddressLoadingState ||
                            state is UpdateAddressLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return SizedBox(
                            width: double.infinity,
                            child: CustomFillButton(
                                title: widget.isAddTitle
                                    ? 'إضافة العنوان'
                                    : 'تعديل العنون',
                                onPress: () {
                                  widget.isAddTitle
                                      ? bloc.add(
                                          SetAddressEvent(
                                              isDefault: "1",
                                              descripion:
                                                  descriptionController.text,
                                              phone: phoneController.text,
                                              type: isHome ? "1" : "0"),
                                        )
                                      : bloc.add(
                                          UpdateAddressEvent(
                                            isDefault: "1",
                                            descripion:
                                                descriptionController.text,
                                            phone: phoneController.text,
                                            type: isHome ? "home" : "work",
                                            id: widget.id!,
                                          ),
                                        );
                                }));
                      },
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

Widget _typeOfTitle(
    {required Color fillColor,
    required String title,
    required Color titleColor}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      border: Border.all(color: mainColor.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(9),
      color: fillColor,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            color: titleColor, fontSize: 15, fontWeight: FontWeight.w300),
      )),
    ),
  );
}
