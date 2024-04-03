part of 'my_orders_bloc.dart';

class MyOrdersStates {}

final class GetCurrentOrdersSuccessState extends MyOrdersStates {}

final class GetCurrentOrdersLoadingState extends MyOrdersStates {}

final class GetCurrentOrdersFailedState extends MyOrdersStates {}



final class GetFinishedOrdersSuccessState extends MyOrdersStates {}

final class GetFinishedOrdersLoadingState extends MyOrdersStates {}

final class GetFinishedOrdersFailedState extends MyOrdersStates {}



final class GetOrderSuccessState extends MyOrdersStates {}

final class GetOrderLoadingState extends MyOrdersStates {}

final class GetOrderFailedState extends MyOrdersStates {}


final class CancelOrderSuccessState extends MyOrdersStates {}
final class CancelOrderLoadingState extends MyOrdersStates {}
final class CancelOrderFailedState extends MyOrdersStates {}