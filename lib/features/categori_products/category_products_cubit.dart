import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/features/categori_products/category_products_states.dart';
import 'package:vegetable_orders_project/features/products/products_model.dart';

class GetCategoryProductsCubit extends Cubit<GetCategoryProductsStates> {
  GetCategoryProductsCubit() : super(GetCategoryProductsStates());

  Future<void> getData({required int id}) async {
    emit(GetCategoryProductsLoadingState());
    final response = await DioHelper().getData(endPoint: 'categories/$id');

    if (response.isSuccess) {
      final model = ProductsData.fromJson(response.response!.data);
      emit(GetCategoryProductsSuccessState(model: model.list));
    } else {
      emit(GetCategoryProductsFailedState(msg: response.message));
    }
  }
}
