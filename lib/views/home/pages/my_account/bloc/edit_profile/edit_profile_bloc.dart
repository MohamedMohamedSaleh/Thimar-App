import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/logic/cache_helper.dart';
import '../../../../../../core/logic/dio_helper.dart';
import '../../../../../../core/logic/helper_methods.dart';
import '../../../../../../models/cities_model.dart';
import '../profile_model.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfilBloc extends Bloc<EditDataEvents, EditDataStates> {
  EditProfilBloc() : super(EditDataInitial()) {
    on<EditProfileEvent>(_editData);
  }
  String? imagePath;
  CityModel? city;

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  Future<void> _editData(
      EditProfileEvent event, Emitter<EditDataStates> emit) async {
    if (formKey.currentState!.validate()) {
      emit(EditProfileDataLoadingState());
      final response =
          await DioHelper().sendData(endPoint: '/client/profile', data: {
        'image': imagePath != null
            ? DioHelper.convertPathToMultiPart(imagePath: imagePath!)
            : null,
        'fullname': event.fullName,
        'phone': event.phone,
        'city_id': city == null ? CacheHelper.getcityId() : city!.id,
      });

      if (response.isSuccess) {
        final model = ProfileData.fromJson(response.response!.data).data;
        CacheHelper.saveEditData(model);
        Navigator.pop(navigatorKey.currentContext!);

        showMessage(message: response.message, type: MessageType.success);

        emit(EditProfileDataSuccessState());
      } else {
        emit(EditProfileDataFailedState());
      }
    } else {
      autovalidateMode = AutovalidateMode.onUserInteraction;
    }
  }
}
