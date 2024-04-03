part of 'my_orders_bloc.dart';

class MyOrdersEvents {}

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
