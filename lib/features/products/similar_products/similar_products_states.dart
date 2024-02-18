

part of  'similar_products_cubit.dart';

class GetSimilarProductStates {}
final class GetSimilarProductLoadingState extends GetSimilarProductStates {}

final class GetSimilarProductfailedState extends GetSimilarProductStates {
  final String msg;

  GetSimilarProductfailedState({required this.msg});
}



final class GetSimilarProductSuccrssState extends GetSimilarProductStates {
  final List<ProductModel> model;

  GetSimilarProductSuccrssState({required this.model});
}