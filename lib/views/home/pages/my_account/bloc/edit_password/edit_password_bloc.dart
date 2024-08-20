import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';

part 'edit_password_event.dart';
part 'edit_password_state.dart';

class EditPasswordBloc extends Bloc<EditPasswordEvents, EditPasswordStates> {
  EditPasswordBloc() : super(EditPasswordInitial()) {
    on<EditPasswordEvent>(_editPassword);
  }

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  Future<void> _editPassword(
      EditPasswordEvent event, Emitter<EditPasswordStates> emit) async {
    if (formKey.currentState!.validate()) {
      emit(EditPasswordLoading());
      final response =
          await DioHelper().updateData(endPoint: '/edit_password', data: {
        'old_password': oldPassword.text,
        'password': newPassword.text,
      });

      if (response.isSuccess) {
        emit(EditPasswordSuccess());
        showMessage(message: response.message, type: MessageType.success);
      Navigator.pop(navigatorKey.currentContext!);

      } else {
        emit(EditPasswordFailed());
        showMessage(message: response.message);
      }
    } else {
      autovalidateMode = AutovalidateMode.onUserInteraction;
    }
  }
}
