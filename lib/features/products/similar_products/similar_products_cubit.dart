import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/logic/dio_helper.dart';
import '../products_model.dart';
part 'similar_products_states.dart';

class GetSimilarProductCubit extends Cubit<GetSimilarProductStates> {
  GetSimilarProductCubit() : super(GetSimilarProductStates());

  Future<void> getSimilarProductData({required int id}) async {
    emit(GetSimilarProductLoadingState());
    final response = await DioHelper().getData(endPoint: 'categories/$id');
    if (response.isSuccess) {
      final model = ProductsData.fromJson(response.response!.data);
      emit(GetSimilarProductSuccrssState(model: model.list));
    } else {
      emit(GetSimilarProductfailedState(msg: response.message));
    }
  }
}
