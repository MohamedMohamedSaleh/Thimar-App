part of 'my_orders_bloc.dart';

class MyOrdersEvents {}

final class AddOrderEvent extends MyOrdersEvents {
  final String payType;
  final String date;
  final String time;

  AddOrderEvent({required this.date,required this.time, required this.payType});
}

class GetCurrentOrdersEvent extends MyOrdersEvents {}

class GetFinishedOrdersEvent extends MyOrdersEvents {}

class GetMyOrderEvent extends MyOrdersEvents {
  final int id;

  GetMyOrderEvent({required this.id});
}

class CancelOrderEvent extends MyOrdersEvents {
  final int id;

  CancelOrderEvent({required this.id});
}
