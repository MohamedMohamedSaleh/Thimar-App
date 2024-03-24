// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/logic/dio_helper.dart';
// import '../../../../core/logic/helper_methods.dart';
// import '../../addresses_model.dart';

// part 'test_address_event.dart';
// part 'test_address_state.dart';

// class TestAddressBloc extends Bloc<TestAddressEvents, TestAddressStates> {
//   TestAddressBloc() : super(TestAddressInitial()) {
//     on<GetTestAddressesEvent>(_getData);
//     on<DeleteTestAddressesEvent>(_deleteData);
//   }
//   List<AddressModel> list = [];

//   Future<void> _getData(
//       GetTestAddressesEvent event, Emitter<TestAddressStates> emit) async {
//     emit(GetLoading());
//     final response = await DioHelper().getData(endPoint: 'client/addresses');
//     if (response.isSuccess) {
//       final model = AddressData.fromJson(response.response!.data);
//       list = model.list;
//       emit(GetSuccess());
//     } else {
//       emit(GetFailed());
//     }
//   }

//   Future<void> _deleteData(
//       DeleteTestAddressesEvent event, Emitter<TestAddressStates> emit) async {
//     emit(DeleteLoading(id: event.id));
//     final response =
//         await DioHelper().deleteData(endPoint: '/client/addresses/${event.id}');
//     if (response.isSuccess) {
//       emit(DeletSuccess());
//       showMessage(message: response.message, type: MessageType.success);
//       add(GetTestAddressesEvent());
//     } else {
//       emit(DeleteFailed());
//     }
//   }
// }
