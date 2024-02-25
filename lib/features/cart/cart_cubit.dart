import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/features/cart/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartStates());

  Future<void> storeProduct({required int id}) async {
    emit(GetCartLoadingStates());
    final response = await DioHelper().sendData(endPoint: "client/cart", data: {
      "product_id": "$id",
      "amount": "1",
    });

    if (response.isSuccess) {
      showMessage(
        message: response.message,
        type: MessageType.success,
      );
      emit(GetCartStuccessStates());
    } else {
      emit(GetCartFailedStates());
      showMessage(message: 'لم يتم إضافة المنتج');
    }
  }
}
