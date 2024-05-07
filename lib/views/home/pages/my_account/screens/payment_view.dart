// import 'package:flutter/material.dart';
// import 'package:vegetable_orders_project/core/constants/my_colors.dart';
// import 'package:vegetable_orders_project/core/widgets/app_image.dart';
// import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
// import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_outline_button.dart';
// import 'package:vegetable_orders_project/views/sheets/add_card_sheet.dart';

// class PaymentView extends StatefulWidget {
//   const PaymentView({super.key});

//   @override
//   State<PaymentView> createState() => _PaymentViewState();
// }

// class _PaymentViewState extends State<PaymentView> {
//   bool isBlackCheck = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(title: 'الدفع'),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 10),
//         child: ListView(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
//             children: [
//               Stack(
//                 children: [
//                   const AppImage(
//                     'assets/images/black_visa.png',
//                   ),
//                   Positioned(
//                     top: -6,
//                     right: -6,
//                     child: Checkbox(
//                       side: const BorderSide(color: Colors.white, width: 1),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       fillColor: const MaterialStatePropertyAll(Colors.white),
//                       checkColor: mainColor,
//                       value: isBlackCheck,
//                       onChanged: (value) {
//                         setState(() {
//                           isBlackCheck = true;
//                           value = true;
//                         });
//                       },
//                     ),
//                   ),
//                   const Positioned(
//                     top: 11,
//                     right: 45,
//                     child: AppImage(
//                       'assets/icon/svg/Trash.svg',
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Stack(
//                 children: [
//                   const AppImage(
//                     'assets/images/green_visa.png',
//                   ),
//                   Positioned(
//                     top: -6,
//                     right: -6,
//                     child: Checkbox(
//                       checkColor: mainColor,
//                       side: const BorderSide(color: Colors.white, width: 1),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       fillColor: const MaterialStatePropertyAll(Colors.white),
//                       value: !isBlackCheck,
//                       onChanged: (value) {
//                         isBlackCheck = false;
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                   const Positioned(
//                       top: 11,
//                       right: 45,
//                       child: AppImage(
//                         'assets/icon/svg/Trash.svg',
//                         color: Colors.white,
//                       )),
//                 ],
//               ),
//               const SizedBox(
//                 height: 22,
//               ),
//               CustomOutlineButton(
//                 onTap: () {
//                   showModalBottomSheet(
//                     clipBehavior: Clip.antiAlias,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(28),
//                         topRight: Radius.circular(28),
//                       ),
//                     ),
//                     context: context,
//                     builder: (context) => const AddCardSheet(),
//                   );
//                 },
//                 title: 'إضافة بطاقة',
//               ),
//             ]),
//       ),
//     );
//   }
// }
