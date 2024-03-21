import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/features/addresses/addresses_model.dart';

part 'get_addresses_events.dart';
part 'get_addresses_states.dart';

class GetAddressesBloc extends Bloc<GetAddressesEvent, GetAddressesStates> {
  GetAddressesBloc() : super(GetAddressesStates()) {
    on<GetAddressesEvent>(_getData);
  }

  List<AddressModel> list = [];
  Future<void> _getData(
      GetAddressesEvent event, Emitter<GetAddressesStates> emit) async {
    emit(GetAddressesLoadingState());
    final response = await DioHelper().getData(endPoint: 'client/addresses');
    if (response.isSuccess) {
      emit(GetAddressesSuccessState());
      final model = AddressData.fromJson(response.response!.data);
      list = model.list;
    } else {
      emit(GetAddressesFailedState());
      showMessage(message: response.message);
    }
  }
}
