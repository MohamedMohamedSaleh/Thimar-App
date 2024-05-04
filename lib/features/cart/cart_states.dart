part of 'cart_bloc.dart';

class CartStates {}

class GetCartStuccessState extends CartStates {
  final CartData model;
  final List<CartModel> list;

////////////////////////////////////////////
  GetCartStuccessState({required this.list, required this.model});
}

class GetCartLoadingState extends CartStates {}

class GetCartFailedState extends CartStates {}

////////////////////////////////////////////
class AddToCartFailedState extends CartStates {}

class AddToCartSuccessState extends CartStates {}

class AddToCartLoadingState extends CartStates {
  final int id;

  AddToCartLoadingState({required this.id});
}

////////////////////////////////////////////
class UpdateAmountSuccessState extends CartStates {}

class UpdateAmountFailedState extends CartStates {}

class UpdateAmountLoadingState extends CartStates {}

////////////////////////////////////////////
class AddCounterSuccessState extends CartStates {}

class MinusCounterSuccessState extends CartStates {}

////////////////////////////////////////////
class DeleteFromCartFailedState extends CartStates {}

class DeleteFromCartSuccessState extends CartStates {}

class DeleteFromCartLoadingState extends CartStates {
  final int id;

  DeleteFromCartLoadingState({required this.id});
}
