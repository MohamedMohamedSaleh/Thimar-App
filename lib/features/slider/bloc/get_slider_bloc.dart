import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';

import '../model.dart';
part 'get_slider_events.dart';
part 'get_slider_state.dart';

class GetSliderBloc extends Bloc<GetSliderEvents, GetSliderStates> {
  GetSliderBloc() : super(GetSliderStates()) {
    on<GetSliderEvent>(_getData);
  }
  bool isTransitionSlider = false;
  List<SliderModel> images = [];
  Future<void> _getData(
      GetSliderEvent event, Emitter<GetSliderStates> emit) async {
    emit(GetSliderLoadingState());
    final response = await DioHelper().getData(endPoint: 'sliders');
    if (response.isSuccess) {
      final model = SliderData.fromJson(response.response!.data);
      images = model.list;
      isTransitionSlider = false;
      emit(GetSliderSuccessState(model: images));
    } else {
      emit(GetSliderfailedState(msg: response.message));
    }
  }
}
