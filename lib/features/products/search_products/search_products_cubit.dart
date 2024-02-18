import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/features/products/search_products/search_products_model.dart';

part 'search_products_states.dart';

class GetSearchProductsCubit extends Cubit<GetSearchProductsStates> {
  GetSearchProductsCubit() : super(GetSearchProductsStates());

  TextEditingController textController = TextEditingController();

  List<SearchResult> search = [];
  Future<void> getSearch(
      {required String text,
      String filter = 'asc',
      String? maxPrice,
      String? minPrice}) async {
    emit(GetSearchProductLoadingState());
    final response =
        await DioHelper().getData(endPoint: 'search/?keyword=$text');
    if (response.isSuccess) {
      // print(response.response!.statusCode);
      search = SearchProductData.fromJson(response.response!.data)
          .data
          .searchResult
          .toList();
      if (text.isEmpty) {
        search.clear();
      }

      emit(GetSearchProductSuccessState());
    } else {
      emit(GetSearchProductFailedState());
    }
  }
}
