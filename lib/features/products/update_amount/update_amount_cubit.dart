import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/features/products/update_amount/update_amount_states.dart';


class UpdateAmountCubit extends Cubit<UpdateAmountStates> {
  UpdateAmountCubit() : super(UpdateAmountStates());

  // CartData cartData;
  void addOne({required int id, required int amount}) {
    if (amount >= 1) {
      emit(AddOneSuccessState(id: id));
    }
  }

  void minusOne({required int id, required int amount}) {
    if (amount > 2) {
      emit(MinusOneSuccessState(id: id));
    }
  }

  Future<void> updateData(
      {required int amount, required int id, required bool isAdd}) async {
    final response =
        await DioHelper().updateData(endPoint: "client/cart/$id", data: {
      'amount': isAdd ? ++amount : --amount,
    });

    if (response.isSuccess) {
      showMessage(message: response.message, type: MessageType.success);
      emit(UpdateAmountSuccessState());
    } else {
      showMessage(message: response.message);
      emit(UpdateAmountFailedState());
    }
  }
}
