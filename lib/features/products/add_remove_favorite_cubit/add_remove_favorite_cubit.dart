import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';

part 'add_remove_favorite_states.dart';

class AddRemoveFavoriteCubit extends Cubit<AddRemoveFavoriteStates> {
  AddRemoveFavoriteCubit() : super(AddRemoveFavoriteStates());

  Future<void> addProduct({required int id}) async {
    final response = await DioHelper()
        .sendData(endPoint: 'client/products/$id/add_to_favorite');
    if (response.isSuccess) {
      showMessage(
          message: response.response!.data['message'],
          type: MessageType.success);
      emit(AddFavoriteSuccessState());
    } else {
      showMessage(message: 'فشل في إضافة المنتج إلى المفضلة');
      emit(AddFavoriteFailedState());
    }
  }

  Future<void> removeProduct({required int id}) async {
    final response = await DioHelper()
        .sendData(endPoint: 'client/products/$id/remove_from_favorite');
    if (response.isSuccess && response.message.isNotEmpty) {
      showMessage(message: response.message, type: MessageType.success);
      emit(RemoveFavoriteSuccessState());
    } else {
      showMessage(message: 'فشل في حذف المنتج من المفضلة');
      emit(RemoveFavoriteFailedState());
    }
  }
}
