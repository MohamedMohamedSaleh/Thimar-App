import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import '../products_model.dart';

part 'get_products_state.dart';

enum ProductsType {mainProducts, favoritesProducts}
class GetProductCubit extends Cubit<GetProductStates> {
  GetProductCubit() : super(GetProductStates());
  Future<void> getData( {required ProductsType type}) async {

    emit(GetProductLoadingState());
    final response = await DioHelper().getData(endPoint:type == ProductsType.mainProducts? 'products' : 'client/products/favorites');
    if (response.isSuccess) {
      final model = ProductsData.fromJson(response.response!.data);
      emit(GetProductSuccrssState(model: model.list));
    } else {
      print(response.response!.data.toString());

      emit(GetProductfailedState(msg: response.message));
    }
    print(type);
  }


  


}
