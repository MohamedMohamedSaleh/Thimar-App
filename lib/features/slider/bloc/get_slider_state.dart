part of 'get_slider_bloc.dart';

class GetSliderStates {}

class GetSliderLoadingState extends GetSliderStates {}

class GetSliderfailedState extends GetSliderStates {
  final String msg;

  GetSliderfailedState({required this.msg});

}

class GetSliderSuccessState extends GetSliderStates {
  final List<SliderModel> model;

  GetSliderSuccessState({required this.model});
}
