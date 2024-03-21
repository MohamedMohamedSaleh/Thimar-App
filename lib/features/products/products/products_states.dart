part of 'products_bloc.dart';

class ProductsStates {}

final class GetFavoriteProductLoadingState extends ProductsStates {}

final class GetFavoriteProductfailedState extends ProductsStates {
  final String msg;

  GetFavoriteProductfailedState({required this.msg});
}

final class GetFavoriteProductSuccrssState extends ProductsStates {
  // final List<ProductModel> model;

  // GetFavoriteProductSuccrssState({required this.model});
}

///////////////////////////////////
class StartAddSuccessState extends ProductsStates {}

class StartRemoveSuccessState extends ProductsStates {}
///////////////////////////////////

class AddFavoriteSuccessState extends ProductsStates {}

class AddFavoriteFailedState extends ProductsStates {}
///////////////////////////////////

class RemoveFavoriteSuccessState extends ProductsStates {}

class RemoveFavoriteFailedState extends ProductsStates {}

///////////////////////////////

final class GetProductLoadingState extends ProductsStates {}

final class GetProductfailedState extends ProductsStates {
  final String msg;

  GetProductfailedState({required this.msg});
}

final class GetProductSuccrssState extends ProductsStates {
  final List<ProductModel> model;

  GetProductSuccrssState({required this.model});
}
