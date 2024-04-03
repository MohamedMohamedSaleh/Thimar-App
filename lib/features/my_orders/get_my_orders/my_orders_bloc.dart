import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/features/my_orders/my_order_model.dart';

import '../all_orders_model.dart';

part 'my_orders_event.dart';
part 'my_orders_state.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvents, MyOrdersStates> {
  MyOrdersBloc() : super(MyOrdersStates()) {
    on<GetCurrentOrdersEvent>(_getCurrentOrder);
    on<GetFinishedOrdersEvent>(_getFinishedOrder);
    on<GetMyOrderEvent>(_getMyOrder);
    on<CancelOrderEvent>(_cancelOrder);
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
      currentOrders = AllOrdersData.fromJson(response.response!.data).list;
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
      finishedOrders = AllOrdersData.fromJson(response.response!.data).list;
    } else {
      emit(GetFinishedOrdersFailedState());
    }
  }

  OrderModel? orderModel;
  Future<void> _getMyOrder(
      GetMyOrderEvent event, Emitter<MyOrdersStates> emit) async {
    
      emit(GetOrderLoadingState());
    
    final response =
        await DioHelper().getData(endPoint: '/client/orders/${event.id}');
    if (response.isSuccess) {
      emit(GetOrderSuccessState());
      orderModel = MyOrderData.fromJson(response.response!.data).data;
    } else {
      emit(GetOrderFailedState());
    }
  }

  Future<void> _cancelOrder(
      CancelOrderEvent event, Emitter<MyOrdersStates> emit) async {
    emit(CancelOrderLoadingState());
    final response = await DioHelper()
        .sendData(endPoint: '/client/orders/${event.id}/cancel');
    if (response.isSuccess) {
      add(GetCurrentOrdersEvent());
      add(GetFinishedOrdersEvent());
    Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.pop(navigatorKey.currentContext!);
    },);
    Future.delayed(const Duration(milliseconds: 200), () {
      emit(CancelOrderSuccessState());
    },);
    } else {
      emit(CancelOrderFailedState());
    }
  }
}
