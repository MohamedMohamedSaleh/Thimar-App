part of 'get_category_bloc.dart';

class GetCategoryStates {}

class GetCtegoryLoadingState extends GetCategoryStates {}

class GetCtegoryFailedState extends GetCategoryStates {
  final String msg;

  GetCtegoryFailedState({required this.msg});

}

class GetCtegorySuccessState extends GetCategoryStates {
  final List<CategoryModel> model;

  GetCtegorySuccessState({required this.model});
}
