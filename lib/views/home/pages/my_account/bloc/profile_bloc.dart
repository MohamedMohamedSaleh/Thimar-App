import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/profile_model.dart';
part 'profile_states.dart';
part 'profile_events.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  ProfileBloc() : super(ProfileStates()) {
    on<GetProfileEvent>(_getData);
  }
  bool isLoading = true;
  MapData data = MapData();
  Future<void> _getData(
      GetProfileEvent event, Emitter<ProfileStates> emit) async {
    if (isLoading) emit(GetProfileDataLoadingState());
    final response = await DioHelper().getData(endPoint: 'client/profile');

    if (response.isSuccess) {
      final model = ProfileData.fromJson(response.response!.data);
      data = model.data;
      isLoading = false;
      emit(GetProfileDataSuccessState(data: model.data));
    } else {
      emit(GetProfileDataFailedState());
    }
  }
}
