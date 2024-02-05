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
