import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';

// import '../favorite_products_model.dart';
import '../../../core/logic/helper_methods.dart';
import '../products_model.dart';

part 'get_favorite_products_state.dart';

class GetFavoriteProductCubit extends Cubit<GetFavoriteProductStates> {
  GetFavoriteProductCubit() : super(GetFavoriteProductStates());

  static Map<int, bool> favorites = {};
  List<ProductModel> list = [];
  Future<void> getData() async {
    emit(GetProductLoadingState());
    final response = await DioHelper().getData(endPoint: 'products');
    if (response.isSuccess) {
      final model = ProductsData.fromJson(response.response!.data);
      for (var element in model.list) {
        favorites.addAll({element.id: element.isFavorite});
      }
      list = model.list;

      emit(GetProductSuccrssState(model: list));
    } else {
      emit(GetProductfailedState(msg: response.message));
    }
  }

  ProductsData? favsModel;

  Future<void> getFavoriteData() async {
    emit(GetFavoriteProductLoadingState());
    final response =
        await DioHelper().getData(endPoint: 'client/products/favorites');
    if (response.isSuccess) {
      favsModel = ProductsData.fromJson(response.response!.data);
      emit(GetFavoriteProductSuccrssState());
    } else {
      emit(GetFavoriteProductfailedState(msg: response.message));
    }
  }

  Future<void> addProduct({required int id}) async {
    favorites[id] = !favorites[id]!;
    emit(StartAddSuccessState());
    final response = await DioHelper()
        .sendData(endPoint: 'client/products/$id/add_to_favorite');
    if (response.isSuccess) {
      showMessage(
          message: response.response!.data['message'],
          type: MessageType.success);
      getData();
      getFavoriteData();
      emit(AddFavoriteSuccessState());
    } else {
      favorites[id] = !favorites[id]!;
      emit(StartRemoveSuccessState());
      showMessage(message: 'فشل في إضافة المنتج إلى المفضلة');
      emit(AddFavoriteFailedState());
    }
  }

  Future<void> removeProduct({required int id}) async {
    favorites[id] = !favorites[id]!;
    emit(StartRemoveSuccessState());
    final response = await DioHelper()
        .sendData(endPoint: 'client/products/$id/remove_from_favorite');
    if (response.isSuccess && response.message.isNotEmpty) {
      showMessage(message: response.message, type: MessageType.success);
      getData();
      getFavoriteData();
      emit(RemoveFavoriteSuccessState());
    } else {
      favorites[id] = !favorites[id]!;
      emit(StartAddSuccessState());
      showMessage(message: 'فشل في إزالة المنتج من المفضلة');
      emit(RemoveFavoriteFailedState());
    }
  }
}
