import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/views/home/home_view.dart';

part 'suggestions_event.dart';
part 'suggestions_state.dart';

class SuggestionsBloc extends Bloc<SuggestionsEvents, SuggestionsStates> {
  SuggestionsBloc() : super(SuggestionsInitial()) {
    on<SendSuggestionsEvent>(_sendData);
  }
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController content = TextEditingController();

  Future<void> _sendData(
      SendSuggestionsEvent event, Emitter<SuggestionsStates> emit) async {
    emit(SentSuggestionsLoading());
    final response = await DioHelper().sendData(endPoint: '/contact', data: {
      "fullname": name.text,
      "phone": phone.text,
      "content": content.text,
    });
    if (response.isSuccess) {
      navigateTo(toPage: const HomeView(), isRemove: true);
      showMessage(message: response.message, type: MessageType.success);
      emit(SentSuggestionsSuccess());
    } else {
      showMessage(message: response.message);

      emit(SentSuggestionsFailed());
    }
  }
}
