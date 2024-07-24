import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/views/auth/login/login_view.dart';

import '../../../../core/logic/dio_helper.dart';
import '../../../../core/logic/helper_methods.dart';

part 'confirm_state.dart';
part 'confirm_events.dart';

class ConfirmBloc extends Bloc<ConfirmEvent, ConfirmStates> {
  ConfirmBloc() : super(ConfirmStates()) {
    on<ConfirmEvent>(_verify);
  }

  final confirmCodeController = TextEditingController();

  void _verify(ConfirmEvent event, Emitter<ConfirmStates> emit) async {
    emit(ConfirmloadingState());
    final response = await DioHelper().sendData(
      endPoint: 'verify',
      data: {
        "code": confirmCodeController.text,
        "phone": event.phone,
        "type": Platform.operatingSystem,
        "device_token": 'test',
      },
    );

    if (response.isSuccess) {
      FocusScope.of(navigatorKey.currentContext!).unfocus();
      showMessage(
        message: navigatorKey.currentContext!.locale.languageCode == 'ar'? "تم التفعيل بنجاح" : "Activation completed successfully",
        type: MessageType.success,
      );
      navigateTo(toPage: const LoginView(), isRemove: true);
      emit(ConfirmSuccessState());
    } else {
      emit(ConfirmFailedState());
      showMessage(message: response.message);
    }
  }
}
