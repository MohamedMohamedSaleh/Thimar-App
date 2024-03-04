part of 'search_products_bloc.dart';

class GetSearchProductsEvents {}

class GetSearchProductsEvent extends GetSearchProductsEvents {
  final String text;

  GetSearchProductsEvent({required this.text});
}
