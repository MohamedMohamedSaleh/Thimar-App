import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';
import '../../../../core/logic/helper_methods.dart';
import '../../../../models/cities_model.dart';
import '../../confirm_code/confirm_code_view.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterStates());

  CityModel? city;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final cityController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      final response = await DioHelper().sendData(
        endPoint: 'client_register',
        data: {
          "fullname": nameController.text,
          "password": passwordController.text,
          "password_confirmation": confirmPasswordController.text,
          "phone": phoneController.text,
          "country_id": '1',
          "city_1": city!.id,
        },
      );

      if (response.isSuccess) {
        emit(RegisterSuccessState());
        showMessage(
          message: response.message,
          type: MessageType.success,
        );
        navegateTo(
          toPage: ConfirmCodeView(
            isActive: true,
            phone: phoneController.text,
          ),
        );
      } else {
        emit(RegisterFailedState());
        showMessage(message: response.message);
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
      
    }
  }
}
