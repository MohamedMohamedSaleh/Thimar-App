import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/features/products/search_products/search_products_model.dart';

part 'search_category_states.dart';

class GetSearchCategoryCubit extends Cubit<GetSearchCategryStates> {
  GetSearchCategoryCubit() : super(GetSearchCategryStates());

  TextEditingController textController = TextEditingController();
  static GetSearchCategoryCubit get(context) => BlocProvider.of(context);
  int minPrice = 1;
  int maxPrice = 2000;
  String filter = 'asc';

  List<SearchResult> search = [];
  Future<void> getSearch({
    String? text,
    required int id,
  }) async {
    emit(GetSearchCategoryLoadingState());
    final response = await DioHelper().getData(
        endPoint:
            'search_category/$id/?filter=$filter&min_price=$minPrice&max_price=$maxPrice&keyword=$text',
        );
    if (response.isSuccess) {
      search = SearchProductData.fromJson(response.response!.data)
          .data
          .searchResult
          .toList();
      print('$minPrice');
      if (text?.isEmpty ?? true) {
        search.clear();
      }

      emit(GetSearchCategrySuccessState());
    } else {
      print(response.message);
      print(response.response!.statusCode);
      emit(GetSearchCategoryFailedState());
    }
  }
}
