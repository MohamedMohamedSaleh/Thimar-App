import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/views/home/home_view.dart';

part 'set_address_events.dart';
part 'set_address_states.dart';

class SetUpdateAdressBloc
    extends Bloc<SetUpdateAddressEvents, SetUpdateAddressStates> {
  SetUpdateAdressBloc() : super(SetUpdateAddressStates()) {
    on<SetAddressEvent>(_addAddress);
    on<UpdateAddressEvent>(_updateAddress);
  }

  String? lat;
  String? lng;
  String? location;

  Future<void> _addAddress(
      SetAddressEvent event, Emitter<SetUpdateAddressStates> emit) async {
    print('***');
    print(lat);
    print('***');
    emit(SetAddressLoadingState());
    final response =
        await DioHelper().sendData(endPoint: '/client/addresses', data: {
      'type': event.type,
      'phone': event.phone,
      'description': event.descripion,
      'location': CacheHelper.getLocation(),
      'lat': CacheHelper.getLat(),
      'lng': CacheHelper.getLng(),
      'is_default': event.isDefault,
    });
    if (response.isSuccess) {
      emit(SetAddressSuccessState());
      showMessage(message: response.message, type: MessageType.success);
      navigateTo(toPage: const HomeView(), isRemove: true);
      CacheHelper.removeLocation();
    } else {
      emit(SetAddressFailedState());
      showMessage(message: response.message);
    }
  }

  Future<void> _updateAddress(
      UpdateAddressEvent event, Emitter<SetUpdateAddressStates> emit) async {
    emit(UpdateAddressLoadingState());
    final response = await DioHelper()
        .updateData(endPoint: '/client/addresses/${event.id}', data: {
      'type': event.type,
      'phone': event.phone,
      'description': event.descripion,
      if(CacheHelper.getLat() != null) 'location': CacheHelper.getLocation(),
     if(CacheHelper.getLat() != null) 'lat': CacheHelper.getLat(),
      if(CacheHelper.getLat() != null)  'lng': CacheHelper.getLng(),
      'is_default': event.isDefault,
    });
    if (response.isSuccess) {
      emit(UpdateAddressSuccessState());
      showMessage(message: response.message, type: MessageType.success);
      navigateTo(toPage: const HomeView(), isRemove: true);
      CacheHelper.removeLocation();
    } else {
      emit(UpdateAddressFailedState());
      showMessage(message: response.message);
    }
  }
}
