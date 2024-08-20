import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';

import '../../../../../../core/logic/helper_methods.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvents, ContactUsState> {
  ContactUsBloc() : super(ContactUsInitial()) {
    on<ContactUsEvent>(_sendData);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Future<void> _sendData(
      ContactUsEvent event, Emitter<ContactUsState> emit) async {
    emit(ContactUsLoading());
    final response = await DioHelper().sendData(endPoint: 'contact', data: {
      "fullname": nameController.text,
      "phone": phoneController.text,
      "content": contentController.text,
    });

    if (response.isSuccess) {
      emit(ContactUsSuccess());
      showMessage(message: response.message, type: MessageType.success);
      Navigator.pop(navigatorKey.currentContext!);
    } else {
      emit(ContactUsFailed());
      showMessage(message: response.message);
    }
  }
}
