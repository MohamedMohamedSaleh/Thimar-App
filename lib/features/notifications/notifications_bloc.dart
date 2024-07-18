import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/features/notifications/model.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvents, NotificationsStates> {
  NotificationsBloc() : super(NotificationsInitial()) {
    on<GetNotificationsEvent>(_getNotifications);
  }
  bool isLoading = true;
  List<dynamic> list = [];
  
  Future<void> _getNotifications(
      GetNotificationsEvent event, Emitter<NotificationsStates> emit) async {
    emit(GetNotificationsLoading());
    final response = await DioHelper().getData(endPoint: 'notifications');

    if (response.isSuccess) {
      emit(GetNotificationsSuccess());
      final model = NotificationsData.fromJson(response.response!.data);
      list = model.data.notifications;
      if (list.isEmpty) {
        emit(GetNotificationsEmpty());
      }
      isLoading = false;
    } else {
      (GetNotificationsFailed());
      isLoading = false;
    }
  }
}
