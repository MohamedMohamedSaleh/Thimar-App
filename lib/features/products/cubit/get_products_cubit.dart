import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/feature/products/products_model.dart';

part 'get_products_state.dart';

class GetProductCubit extends Cubit<GetProductStates> {
  GetProductCubit() : super(GetProductStates());

  Future<void> getData() async {
    emit(GetProductLoadingState());
    final response = await DioHelper().getData(endPoint: 'products');
    if (response.isSuccess) {
      final model = ProductsData.fromJson(response.response!.data);
      emit(GetProductSuccrssState(model: model.list));
    } else {
      emit(GetProductfailedState(msg: response.message));
    }
  }
}
