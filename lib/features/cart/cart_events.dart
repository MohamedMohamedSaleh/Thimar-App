part of 'cart_bloc.dart';

class CartEvents {}

class ShowCartEvent extends CartEvents {
  final bool isLoading;

  ShowCartEvent({required this.isLoading});
}

class StorProductCartEvent extends CartEvents {
  final int id;
  final int amount;
  final bool isProduct;
  final ProductModel? model;
  final SearchResult? searchModel;

  StorProductCartEvent(
      {this.searchModel,
      this.amount = 1,
      this.model,
      this.isProduct = false,
      required this.id});
}

class UpdateProductCartEvent extends CartEvents {
  final int amount;
  final int id;

  UpdateProductCartEvent({required this.amount, required this.id});
}

class CounterProductsEvent extends CartEvents {
  final bool isAdd;

  CounterProductsEvent({required this.isAdd});
}

class DeletProductCartEvent extends CartEvents {
  final int id;

  DeletProductCartEvent({required this.id});
}
