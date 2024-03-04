part of 'cart_bloc.dart';

class CartEvents {}

class ShowCartEvent extends CartEvents {
  final bool isLoading;

  ShowCartEvent({required this.isLoading});
}

class StorProductCartEvent extends CartEvents {
  final int id;

  StorProductCartEvent({required this.id});
}

class DeletProductCartEvent extends CartEvents {
    final int id;

  DeletProductCartEvent({required this.id});
}
