import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/get_profile/profile_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/change_password.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_my_data.dart';
import 'package:vegetable_orders_project/views/sheets/cities_sheet.dart';

import '../../../../../models/cities_model.dart';
import '../bloc/edit_profile/edit_profile_bloc.dart';

class PersonalDataView extends StatefulWidget {
  const PersonalDataView({super.key});

  @override
  State<PersonalDataView> createState() => _PersonalDataViewState();
}

class _PersonalDataViewState extends State<PersonalDataView> {
  final bloc = KiwiContainer().resolve<ProfileBloc>();
  final editProfileBloc = KiwiContainer().resolve<EditProfilBloc>();
  CityModel? city;
  @override
  void initState() {
    super.initState();
    bloc.nameController.text = CacheHelper.getUserName() ?? '';
    bloc.phoneController.text = CacheHelper.getUserPhone() ?? '';
    bloc.cityController.text = CacheHelper.getUserCity() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        editProfileBloc.imagePath = null;
      },
      child: ColoredBox(
        color: Colors.white,
        child: FadeIn(
          duration: const Duration(milliseconds: 500),
          child: Scaffold(
            appBar: const CustomAppBar(title: 'البيانات الشخصية'),
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Form(
                key: editProfileBloc.formKey,
                autovalidateMode: editProfileBloc.autovalidateMode,
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomMyData(
                      isMain: false,
                    ),

                    const SizedBox(
                      height: 18,
                    ),
                    CustomAppInput(
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "اسم المستخدم مطلوب";
                        }
                        return null;
                      },
                      isData: true,
                      controller: bloc.nameController,
                      fillColor: const Color(0xffFAFFF5),
                      labelText: 'اسم المستخدم',
                      prefixIcon: 'assets/icon/svg/account/User.svg',
                    ),
                    // SizedBox(height: 16,),
                    CustomAppInput(
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "رقم الجوال مطلوب";
                        } else if (value!.length < 10) {
                          return "رقم الهاتف يجب أن يكون أكبر من 10 أرقام";
                        }
                        return null;
                      },
                      isPhone: true,
                      isData: true,
                      controller: bloc.phoneController,
                      fillColor: const Color(0xffFAFFF5),
                      labelText: 'رقم الجوال',
                      prefixIcon: 'assets/icon/svg/account/Phone.svg',
                    ),
                    // SizedBox(height: 16,),
                    StatefulBuilder(
                      builder: (context, setState) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                editProfileBloc.city =
                                    await showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(28),
                                      topRight: Radius.circular(28),
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  context: context,
                                  builder: (context) => const CitiesSheet(),
                                );
                                if (editProfileBloc.city != null) {
                                  bloc.cityController.text =
                                      editProfileBloc.city!.name;
                                  setState(() {});
                                }
                              },
                              child: AbsorbPointer(
                                absorbing: true,
                                child: CustomAppInput(
                                  validator: (value) {
                                    if (bloc.cityController.text.isEmpty) {
                                      return "المدينة مطلوبة";
                                    }
                                    return null;
                                  },
                                  isData: true,
                                  controller: bloc.cityController,
                                  fillColor: const Color(0xffFAFFF5),
                                  labelText: 'المدينة',
                                  prefixIcon:
                                      'assets/icon/svg/account/Report.svg',
                                ),
                              ),
                            ),
                          ),
                          (bloc.cityController.text.isNotEmpty)
                              ? IconButton(
                                  onPressed: () {
                                    bloc.cityController.text = '';
                                    editProfileBloc.city = null;
                                    setState(
                                      () {},
                                    );
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.red.shade400,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    // SizedBox(height: 16,),
                    GestureDetector(
                      onTap: () =>
                          navigateTo(toPage: const ChangePasswordAccountView()),
                      child: const CustomAppInput(
                        isEnabled: false,
                        suffixIcon:
                            AppImage('assets/icon/svg/line_arrow_acount.svg'),
                        isData: true,
                        fillColor: Color(0xffFAFFF5),
                        labelText: 'كلمة المرور',
                        prefixIcon: 'assets/icon/svg/account/Unlock.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: SafeArea(
                  child: BlocBuilder(
                bloc: editProfileBloc,
                builder: (context, state) {
                  if (state is EditProfileDataLoadingState) {
                    return const SizedBox(
                      height: 45,
                      width: 45,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return CustomFillButton(
                        title: 'تعديل البيانات',
                        onPress: () {
                          editProfileBloc.add(EditProfileEvent(
                              fullName: bloc.nameController.text,
                              phone: bloc.phoneController.text));
                        });
                  }
                },
              )),
            ),
          ),
        ),
      ),
    );
  }
}
