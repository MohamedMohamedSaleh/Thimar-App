import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/features/cart/cart_model.dart';
import 'package:vegetable_orders_project/features/cart/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartStates());

  CartData? cartData;

  Future<void> showCart({bool isLoading = true}) async {
    if(isLoading){
    emit(GetCartLoadingState());
    } 
    final response = await DioHelper().getData(endPoint: "client/cart");

    if (response.isSuccess) {
      showMessage(
        message: response.message,
        type: MessageType.success,
      );
      final model = CartData.fromJson(response.response!.data);
      cartData = model;
      emit(GetCartStuccessState(model: cartData!));
    } else {
      emit(GetCartFailedState());
      showMessage(message: response.message);
    }
  }


  Future<void> storeProduct({required int id}) async {
    emit(AddToCartLoadingState(id: id));
    final response = await DioHelper().sendData(endPoint: "client/cart", data: {
      "product_id": "$id",
      "amount": "1",
    });

    if (response.isSuccess) {
      final model = AddProductData.fromJson(response.response!.data);
      showMessage(
        message: response.message,
        type: MessageType.success,
      );
      showCart();
      emit(AddToCartSuccessState());

    } else {
      emit(AddToCartFailedState());
      showMessage(message: 'لم يتم إضافة المنتج');
    }
  }


  Future<void> deleteProduct({required int id}) async {
    emit(DeleteFromCartLoadingState());
    final response =
        await DioHelper().deleteData(endPoint: 'client/cart/delete_item/$id');

    if (response.isSuccess) {

      cartData!.list.removeWhere((element) => element.id == id);

      emit(DeleteFromCartSuccessState());
      showMessage(message: 'success', type: MessageType.success);
    } else {
      emit(DeleteFromCartFailedState());
    }
  }

  
}
