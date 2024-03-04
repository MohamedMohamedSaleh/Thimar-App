part of 'search_category_bloc.dart';

class GetSearchCategoryEvents {}

class GetSearchCategoryEvent extends GetSearchCategoryEvents {
  final int id;
  final String? text;

  GetSearchCategoryEvent({required this.id,this.text});
}
