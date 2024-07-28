import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';

import '../category_model.dart';
part 'get_category_events.dart';
part 'get_category_state.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvents, GetCategoryStates> {
  GetCategoryBloc() : super(GetCategoryStates()) {
    on<GetCategoryEvent>(_getData);
  }

  bool isTransitionCategory = false;
  Future<void> _getData(
      GetCategoryEvent event, Emitter<GetCategoryStates> emit) async {
    emit(GetCtegoryLoadingState());
    final response = await DioHelper().getData(endPoint: 'categories');

    if (response.isSuccess) {
      final model = CategoryData.fromJson(response.response!.data);
      isTransitionCategory = false;
      emit(GetCtegorySuccessState(model: model.list));
    } else {
      emit(GetCtegoryFailedState(msg: response.message));
    }
  }
}
