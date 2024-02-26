import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/cubit/profile_model.dart';
part 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileStates());
  
  // Map<String, dynamic> data = {};
  Future<void> getData() async {
    emit(GetProfileDataLoadingState());
    final response = await DioHelper().getData(endPoint: 'client/profile');

    if (response.isSuccess) {
      final model = ProfileData.fromJson(response.response!.data);
    
      emit(GetProfileDataSuccessState(data: model.data));
    } else {
      emit(GetProfileDataFailedState());
    }
  }
}
