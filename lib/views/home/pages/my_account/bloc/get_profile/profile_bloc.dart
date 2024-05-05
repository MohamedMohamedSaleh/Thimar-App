import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/profile_model.dart';

part 'profile_states.dart';
part 'profile_events.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  ProfileBloc() : super(ProfileStates()) {
    on<GetProfileEvent>(_getData);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isLoaing = true;

  UserDataProfile data = UserDataProfile();
  Future<void> _getData(
      GetProfileEvent event, Emitter<ProfileStates> emit) async {
    if (isLoaing) emit(GetProfileDataLoadingState());
    final response = await DioHelper().getData(endPoint: 'client/profile');

    if (response.isSuccess) {
      isLoaing = false;
      final model = ProfileData.fromJson(response.response!.data).data;
      CacheHelper.saveEditData(model);
      data = model;
      emit(GetProfileDataSuccessState(data: model));
    } else {
      emit(GetProfileDataFailedState());
    }
  }
}
