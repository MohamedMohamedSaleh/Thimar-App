import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';

import '../../../core/logic/cache_helper.dart';
import '../login/login_view.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvents, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutEvent>((event, emit) async {
      emit(LogoutLoading());
      final response = await DioHelper().sendData(
        endPoint: 'logout',
      );

      if (response.isSuccess) {
        emit(LogoutSuccess());
        CacheHelper.clearUserData();

        navigateTo(toPage: const LoginView(), isRemove: true);

        showMessage(message: response.message, type: MessageType.success);
      } else {
        emit(LogoutFailed());
        showMessage(message: response.message);
      }
    });
  }
}
