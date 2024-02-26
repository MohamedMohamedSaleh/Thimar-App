import 'package:vegetable_orders_project/features/cart/cart_model.dart';

class CartStates {}

class GetCartStuccessState extends CartStates {
  final CartData model;

  GetCartStuccessState({required this.model});

}

class GetCartLoadingState extends CartStates {}

class GetCartFailedState extends CartStates {}


class AddToCartFailedState extends CartStates {}
class AddToCartSuccessState extends CartStates {}
class AddToCartLoadingState extends CartStates {}


class DeleteFromCartFailedState extends CartStates {}
class DeleteFromCartSuccessState extends CartStates {}
class DeleteFromCartLoadingState extends CartStates {}
