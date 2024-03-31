import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';

import '../model.dart';

part 'my_orders_event.dart';
part 'my_orders_state.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvents, MyOrdersStates> {
  MyOrdersBloc() : super(MyOrdersStates()) {
    on<GetCurrentOrdersEvent>(_getCurrentOrder);
    on<GetFinishedOrdersEvent>(_getFinishedOrder);
  }

  List<CurrentOrdersModel> currentOrders = [];
  List<CurrentOrdersModel> finishedOrders = [];
  Future<void> _getCurrentOrder(
      GetCurrentOrdersEvent event, Emitter<MyOrdersStates> emit) async {
    emit(GetCurrentOrdersLoadingState());
    final response =
        await DioHelper().getData(endPoint: '/client/orders/current');
    if (response.isSuccess) {
      emit(GetCurrentOrdersSuccessState());
      currentOrders = CurrentOrdersData.fromJson(response.response!.data).list;
    } else {
      emit(GetCurrentOrdersFailedState());
    }
  }
  Future<void> _getFinishedOrder(
      GetFinishedOrdersEvent event, Emitter<MyOrdersStates> emit) async {
    emit(GetFinishedOrdersLoadingState());
    final response =
        await DioHelper().getData(endPoint: '/client/orders/finished');
    if (response.isSuccess) {
      emit(GetFinishedOrdersSuccessState());
      finishedOrders = CurrentOrdersData.fromJson(response.response!.data).list;
    } else {
      emit(GetFinishedOrdersFailedState());
    }
  }
}
