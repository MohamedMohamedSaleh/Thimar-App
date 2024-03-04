import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/features/products/products_model.dart';

part 'category_products_states.dart';
part 'category_products_events.dart';

class GetCategoryProductsBloc
    extends Bloc<GetCategoryEvents, GetCategoryProductsStates> {
  GetCategoryProductsBloc() : super(GetCategoryProductsStates()) {
    on<GetCategoryProductEvent>(_getData);
  }

  Future<void> _getData(GetCategoryProductEvent event,
      Emitter<GetCategoryProductsStates> emit) async {
    emit(GetCategoryProductsLoadingState());
    final response =
        await DioHelper().getData(endPoint: 'categories/${event.id}');

    if (response.isSuccess) {
      final model = ProductsData.fromJson(response.response!.data);
      emit(GetCategoryProductsSuccessState(model: model.list));
    } else {
      emit(GetCategoryProductsFailedState(msg: response.message));
    }
  }
}
