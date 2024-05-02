import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/features/products/search_products/search_products_model.dart';

part 'search_products_states.dart';
part 'search_products_events.dart';

class GetSearchProductsBloc
    extends Bloc<GetSearchProductsEvents, GetSearchProductsStates> {
  GetSearchProductsBloc() : super(GetSearchProductsStates()) {
    on<GetSearchProductsEvent>(_getSearch);
  }

  TextEditingController textController = TextEditingController();

  List<SearchResult> search = [];
  Future<void> _getSearch(GetSearchProductsEvent event, Emitter<GetSearchProductsStates> emit) async {
    emit(GetSearchProductLoadingState());
    final response = await DioHelper().getData(endPoint: 'search/', data: {
      'keyword': event.text,
    });
    if (response.isSuccess) {
      search = SearchProductData.fromJson(response.response!.data)
          .data
          .searchResult
          .toList();
      if (event.text.isEmpty) {
        search.clear();
      }

      emit(GetSearchProductSuccessState());
    } else {
      emit(GetSearchProductFailedState());
    }
  }
}
