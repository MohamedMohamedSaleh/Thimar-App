import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';

// import '../favorite_products_model.dart';
import '../../../core/logic/helper_methods.dart';
import '../products_model.dart';

part 'products_states.dart';
part 'products_events.dart';

class ProductsBloc extends Bloc<ProductsEvents, ProductsStates> {
  ProductsBloc() : super(ProductsStates()) {
    on<GetProductsEvent>(_getData);
    on<GetFavsProductsEvent>(_getFavoriteData);
    on<AddProductsToFavsEvent>(_addProductToFavs);
    on<RemoveProductsFromFavsEvent>(_removeProductFromFavs);
  }

  static Map<int, bool> favorites = {};
  List<ProductModel> list = [];
  Future<void> _getData(
      GetProductsEvent event, Emitter<ProductsStates> emit) async {
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

  List<ProductModel> favsList = [];

  Future<void> _getFavoriteData(
      GetFavsProductsEvent event, Emitter<ProductsStates> emit) async {
    emit(GetFavoriteProductLoadingState());
    final response =
        await DioHelper().getData(endPoint: 'client/products/favorites');
    if (response.isSuccess) {
      final favsModel = ProductsData.fromJson(response.response!.data);
      favsList = favsModel.list;
      emit(GetFavoriteProductSuccrssState());
    } else {
      emit(GetFavoriteProductfailedState(msg: response.message));
    }
  }

  Future<void> _addProductToFavs(
      AddProductsToFavsEvent event, Emitter<ProductsStates> emit) async {
    favorites[event.id] = !favorites[event.id]!;
    emit(StartAddSuccessState());
    final response = await DioHelper()
        .sendData(endPoint: 'client/products/${event.id}/add_to_favorite');
    if (response.isSuccess) {
      showMessage(
          message: response.response!.data['message'],
          type: MessageType.success);
      add(GetProductsEvent());
      add(GetFavsProductsEvent());
      emit(AddFavoriteSuccessState());
    } else {
      favorites[event.id] = !favorites[event.id]!;
      emit(StartRemoveSuccessState());
      showMessage(message: 'فشل في إضافة المنتج إلى المفضلة');
      emit(AddFavoriteFailedState());
    }
  }

  Future<void> _removeProductFromFavs(
      RemoveProductsFromFavsEvent event, Emitter<ProductsStates> emit) async {
    favorites[event.id] = !favorites[event.id]!;
    emit(StartRemoveSuccessState());
    final response = await DioHelper()
        .sendData(endPoint: 'client/products/${event.id}/remove_from_favorite');
    if (response.isSuccess && response.message.isNotEmpty) {
      showMessage(message: response.message, type: MessageType.success);
      add(GetProductsEvent());
      add(GetFavsProductsEvent());
      emit(RemoveFavoriteSuccessState());
    } else {
      favorites[event.id] = !favorites[event.id]!;
      emit(StartAddSuccessState());
      showMessage(message: 'فشل في إزالة المنتج من المفضلة');
      emit(RemoveFavoriteFailedState());
    }
  }
}
