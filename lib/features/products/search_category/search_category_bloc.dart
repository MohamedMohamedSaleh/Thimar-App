import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/features/products/search_products/search_products_model.dart';

part 'search_category_states.dart';
part 'search_category_events.dart';

class GetSearchCategoryBloc
    extends Bloc<GetSearchCategoryEvents, GetSearchCategryStates> {
  GetSearchCategoryBloc() : super(GetSearchCategryStates()) {
    on<GetSearchCategoryEvent>(_getSearch);
  }

  TextEditingController textController = TextEditingController();
  static GetSearchCategoryBloc get(context) => BlocProvider.of(context);
  int minPrice = 1;
  int maxPrice = 2000;
  String filter = 'asc';

  List<SearchResult> search = [];
  Future<void> _getSearch(GetSearchCategoryEvent event,
      Emitter<GetSearchCategryStates> emit) async {
    emit(GetSearchCategoryLoadingState());
    final response = await DioHelper().getData(
      endPoint:
          'search_category/${event.id}/?filter=$filter&min_price=$minPrice&max_price=$maxPrice&keyword=${event.text}',
    );
    if (response.isSuccess) {
      search = SearchProductData.fromJson(response.response!.data)
          .data
          .searchResult
          .toList();
      if (event.text?.isEmpty ?? true) {
        search.clear();
      }

      emit(GetSearchCategrySuccessState());
    } else {
      emit(GetSearchCategoryFailedState());
    }
  }
}
