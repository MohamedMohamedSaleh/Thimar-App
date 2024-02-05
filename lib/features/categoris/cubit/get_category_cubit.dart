import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';

import '../category_model.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryStates> {
  GetCategoryCubit() : super(GetCategoryStates());

  Future<void> getData() async {
    emit(GetCtegoryLoadingState());
    final response = await DioHelper().getData(endPoint: 'categories');

    if (response.isSuccess) {
      final model = CategoryData.fromJson(response.response!.data);
      emit(GetCtegorySuccessState(model: model.list));
    } else {
      emit(GetCtegoryFailedState(msg: response.message));
    }
  }
}
