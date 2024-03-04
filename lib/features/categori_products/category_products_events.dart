part of 'category_products_bloc.dart';

class GetCategoryEvents {}

class GetCategoryProductEvent extends GetCategoryEvents {
  final int id;

  GetCategoryProductEvent({required this.id});
}
