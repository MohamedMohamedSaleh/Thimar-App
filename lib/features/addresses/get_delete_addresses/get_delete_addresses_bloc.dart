import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/features/addresses/addresses_model.dart';

part 'get_delete_addresses_events.dart';
part 'get_delete_addresses_states.dart';

class GetDeleteAddressesBloc
    extends Bloc<GetDeleteAddressesEvents, GetDeleteAddressesStates> {
  GetDeleteAddressesBloc() : super(GetDeleteAddressesStates()) {
    on<GetAddressesEvent>(_getData);
    on<DeleteAddressesEvent>(_deleteData);
  }

  List<AddressModel> list = [];
  Future<void> _getData(
      GetAddressesEvent event, Emitter<GetDeleteAddressesStates> emit) async {
    if (event.isLoading) {
      emit(GetAddressesLoadingState());
    }

    final response = await DioHelper().getData(endPoint: 'client/addresses');
    if (response.isSuccess) {
      final model = AddressData.fromJson(response.response!.data);
      list = model.list;
      emit(GetAddressesSuccessState());
    } else {
      emit(GetAddressesFailedState());
      showMessage(message: response.message);
    }
  }

  Future<void> _deleteData(DeleteAddressesEvent event,
      Emitter<GetDeleteAddressesStates> emit) async {
    emit(DeleteAddressesLoadingState(id: event.id));
    final response =
        await DioHelper().deleteData(endPoint: '/client/addresses/${event.id}');
    if (response.isSuccess) {
      Future.delayed(
       const Duration(milliseconds: 700),
        () {
          showMessage(message: response.message, type: MessageType.success);
        },
      );
      add(GetAddressesEvent(isLoading: false));
      emit(DeleteAddressesSuccessState(id: event.id));
    } else {
      emit(DeleteAddressesFailedState());
      showMessage(message: response.message);
    }
  }
}
