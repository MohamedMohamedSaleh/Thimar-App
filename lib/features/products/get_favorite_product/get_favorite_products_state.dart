part of 'get_favorite_products_cubit.dart';

class GetFavoriteProductStates {}


final class GetFavoriteProductLoadingState extends GetFavoriteProductStates {}

final class GetFavoriteProductfailedState extends GetFavoriteProductStates {
  final String msg;

  GetFavoriteProductfailedState({required this.msg});
}

final class GetFavoriteProductSuccrssState extends GetFavoriteProductStates {
  // final List<ProductModel> model;

  // GetFavoriteProductSuccrssState({required this.model});
}

///////////////////////////////////
class StartAddSuccessState extends GetFavoriteProductStates {}

class StartRemoveSuccessState extends GetFavoriteProductStates {}

class AddFavoriteSuccessState extends GetFavoriteProductStates {}

class AddFavoriteFailedState extends GetFavoriteProductStates {}

class RemoveFavoriteSuccessState extends GetFavoriteProductStates {}

class RemoveFavoriteFailedState extends GetFavoriteProductStates {}

///////////////////////////////

final class GetProductLoadingState extends GetFavoriteProductStates {}

final class GetProductfailedState extends GetFavoriteProductStates {
  final String msg;

  GetProductfailedState({required this.msg});
}

final class GetProductSuccrssState extends GetFavoriteProductStates {
  final List<ProductModel> model;

  GetProductSuccrssState({required this.model});
}