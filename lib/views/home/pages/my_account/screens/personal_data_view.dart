import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/cubit/profile_cubit.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_my_data.dart';

class PersonalDataView extends StatefulWidget {
  const PersonalDataView({super.key});

  @override
  State<PersonalDataView> createState() => _PersonalDataViewState();
}

class _PersonalDataViewState extends State<PersonalDataView> {
  final cubit = KiwiContainer().resolve<ProfileCubit>()..getData();
  TextEditingController nameController =
      TextEditingController(text: "محمد علي");
  TextEditingController numberController =
      TextEditingController(text: "01009294728");
  TextEditingController cityController =
      TextEditingController(text: "المنصورة");
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'البيانات الشخصية'),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              isData: true,
              controller: nameController,
              fillColor: const Color(0xffFAFFF5),
              labelText: 'اسم المستخدم',
              prefixIcon: 'assets/icon/svg/account/User.svg',
            ),
            // SizedBox(height: 16,),
            CustomAppInput(
              isPhone: true,
              isData: true,
              controller: numberController,
              fillColor: const Color(0xffFAFFF5),
              labelText: 'رقم الجوال',
              prefixIcon: 'assets/icon/svg/account/Phone.svg',
            ),
            // SizedBox(height: 16,),
            CustomAppInput(
              isEnabled: false,
              isData: true,
              controller: cityController,
              fillColor: const Color(0xffFAFFF5),
              labelText: 'المدينة',
              prefixIcon: 'assets/icon/svg/account/Report.svg',
            ),
            // SizedBox(height: 16,),
            CustomAppInput(
              isPassword: true,
              isData: true,
              controller: passwordController,
              fillColor: const Color(0xffFAFFF5),
              labelText: 'كلمة المرور',
              prefixIcon: 'assets/icon/svg/account/Unlock.svg',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        child: SafeArea(
            child: CustomFillButton(title: 'تعديل البيانات', onPress: () {})),
      ),
    );
  }
}
