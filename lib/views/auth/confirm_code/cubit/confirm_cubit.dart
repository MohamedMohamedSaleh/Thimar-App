import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/views/auth/login/login_view.dart';

import '../../../../core/logic/dio_helper.dart';
import '../../../../core/logic/helper_methods.dart';
import '../../change_password/change_password_view.dart';

part 'confirm_state.dart';

class ConfirmCubit extends Cubit<ConfirmStates> {
  ConfirmCubit() : super(ConfirmStates());

  final confirmCodeController = TextEditingController();
  bool isLoading = false;
  void verify({required String phone, required bool isActive}) async {
    emit(ConfirmloadingState());
    final response = await DioHelper().sendData(
      endPoint:isActive? 'verify' : 'check_code',
      data: {
        "code": confirmCodeController.text,
        "phone": phone,
        "type": Platform.operatingSystem,
        "device_token": 'test',
      },
    );

    if (response.isSuccess) {
      if (!(navigatorKey.currentContext!).mounted) return;
      FocusScope.of(navigatorKey.currentContext!).unfocus();
      showMessage(
        message: "تم تفعيل حسابك بنجاح",
        type: MessageType.success,
      );
      if (!isActive) {
        navegateTo(toPage: const ChangePasswordView());
      } else {
        navegateTo(toPage: const LoginView());
        showMessage(message: response.message);
      }
      emit(ConfirmSuccessState());
    } else {
      emit(ConfirmFailedState());
    }
  }
}
