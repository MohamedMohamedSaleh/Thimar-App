part of 'get_products_cubit.dart';

class GetProductStates {}

final class GetProductLoadingState extends GetProductStates {}

final class GetProductfailedState extends GetProductStates {
  final String msg;

  GetProductfailedState({required this.msg});
}

final class GetProductSuccrssState extends GetProductStates {
  final List<ProductModel> model;

  GetProductSuccrssState({required this.model});
}
final class GetFasProductLoadingState extends GetProductStates {}

final class GetFasProductfailedState extends GetProductStates {
  final String msg;

  GetFasProductfailedState({required this.msg});
}

final class GetFasProductSuccrssState extends GetProductStates {
  final List<ProductModel> model;

  GetFasProductSuccrssState({required this.model});
}
