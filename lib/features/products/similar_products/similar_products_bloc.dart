import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/logic/dio_helper.dart';
import '../products_model.dart';
part 'similar_products_states.dart';
part 'similar_products_events.dart';

class GetSimilarProductBloc
    extends Bloc<GetSimilarProductsEvents, GetSimilarProductStates> {
  GetSimilarProductBloc() : super(GetSimilarProductStates()) {
    on<GetSimilarProductsEvent>(_getSimilarProductData);
  }

  Future<void> _getSimilarProductData(GetSimilarProductsEvent event, Emitter<GetSimilarProductStates> emit) async {
    emit(GetSimilarProductLoadingState());
    final response = await DioHelper().getData(endPoint: 'categories/${event.id}');
    if (response.isSuccess) {
      final model = ProductsData.fromJson(response.response!.data);
      emit(GetSimilarProductSuccrssState(model: model.list));
    } else {
      emit(GetSimilarProductfailedState(msg: response.message));
    }
  }
}
