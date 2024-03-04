import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/features/cart/cart_model.dart';

part 'cart_events.dart';
part 'cart_states.dart';

class CartBloc extends Bloc<CartEvents, CartStates> {
  CartBloc() : super(CartStates()) {
    on<ShowCartEvent>(_showCart);
    on<StorProductCartEvent>(_storeProduct);
    on<DeletProductCartEvent>(_deleteProduct);
  }

  CartData? cartData;
  List<CartModel> list = [];

  Future<void> _showCart(ShowCartEvent event, Emitter<CartStates> emit) async {
    if (event.isLoading) {
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
      list = model.list;
      emit(GetCartStuccessState(model: cartData!, list: list));
    } else {
      emit(GetCartFailedState());
      showMessage(message: response.message);
    }
  }

  Future<void> _storeProduct(
      StorProductCartEvent event, Emitter<CartStates> emit) async {
    emit(AddToCartLoadingState(id: event.id));
    final response = await DioHelper().sendData(endPoint: "client/cart", data: {
      "product_id": "${event.id}",
      "amount": "1",
    });

    if (response.isSuccess) {
      // final model = AddProductData.fromJson(response.response!.data);
      showMessage(
        message: response.message,
        type: MessageType.success,
      );
      add(ShowCartEvent(isLoading: false));
      emit(AddToCartSuccessState());
    } else {
      emit(AddToCartFailedState());
      showMessage(message: 'لم يتم إضافة المنتج');
    }
  }

  Future<void> _deleteProduct(
      DeletProductCartEvent event, Emitter<CartStates> emit) async {
    emit(DeleteFromCartLoadingState());
    final response = await DioHelper()
        .deleteData(endPoint: 'client/cart/delete_item/${event.id}');

    if (response.isSuccess) {
      list.removeWhere((element) => element.id == event.id);

      emit(DeleteFromCartSuccessState());
      showMessage(message: response.message, type: MessageType.success);
      Navigator.pop(navigatorKey.currentContext!);
    } else {
      emit(DeleteFromCartFailedState());
    }
  }
}
