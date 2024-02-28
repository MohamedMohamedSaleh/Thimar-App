import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/features/products/update_amount/update_amount_states.dart';

class UpdateAmountCubit extends Cubit<UpdateAmountStates> {
  UpdateAmountCubit() : super(UpdateAmountStates());

  int amount = 1;
  void addOne({required int id}) {
    if (amount >= 0) {
      amount++;
    }
    emit(AddOneSuccessState(id: id));
  }

  void minusOne({required int id}) {
    if (amount > 1) {
      amount--;
    }
    emit(MinusOneSuccessState(id: id));
  }
}
