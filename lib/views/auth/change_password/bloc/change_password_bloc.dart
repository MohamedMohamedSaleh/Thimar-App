import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/views/auth/change_password/change_password_view.dart';
import 'package:vegetable_orders_project/views/auth/login/login_view.dart';

import '../../../../core/logic/dio_helper.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvents, ChangePasswordStates> {
  ChangePasswordBloc() : super(ChangePasswordStates()) {
    on<CheckCodeEvent>(_checkCode);
    on<ResetPasswordEvent>(_resetPassword);
  }
  final confirmCodeController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> _checkCode(
      CheckCodeEvent event, Emitter<ChangePasswordStates> emit) async {
    emit(CheckCodeLoadingState());
    final response = await DioHelper().sendData(endPoint: 'check_code', data: {
      "phone": event.phone,
      "code": confirmCodeController.text,
    });
    if (response.isSuccess) {
      emit(CheckCodeSuccessState());
      navigateTo(toPage:  ChangePasswordView(phone: event.phone,));
    } else {
      print('failed');
      emit(CheckCodeFailedState());
      showMessage(message: response.message);
    }
  }

  Future<void> _resetPassword(
      ResetPasswordEvent event, Emitter<ChangePasswordStates> emit) async {
    emit(ResetPasswordLoadingState());
    final response =
        await DioHelper().sendData(endPoint: 'reset_password', data: {
      "phone": event.phone,
      "code": '1111',
      "password": passwordController.text,
    });
    if (response.isSuccess) {
      emit(ResetPasswordSuccessState());
      showMessage(message: response.message, type: MessageType.success);
      navigateTo(toPage: const LoginView(), isRemove: true);
    } else {
      emit(ResetPasswordFailedState());
      showMessage(message: response.message);
    }
  }
}
