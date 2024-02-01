import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';

import '../model.dart';

part 'get_slider_state.dart';

class GetSliderCubit extends Cubit<GetSliderStates> {
  GetSliderCubit() : super(GetSliderStates());

  Future<void> getData() async {
    emit(GetSliderLoadingState());
    final response = await DioHelper().getData(endPoint: 'sliders');
    if (response.isSuccess) {
      final model = SliderData.fromJson(response.response!.data);
      emit(GetSliderSuccessState(model: model.list));
    } else {
      emit(GetSliderfailedState(msg: response.message));
    }
  }
}
