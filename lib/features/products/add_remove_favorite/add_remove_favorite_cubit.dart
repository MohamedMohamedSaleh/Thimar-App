// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
// import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
// import 'package:vegetable_orders_project/features/products/get_favorite_product/get_favorite_products_cubit.dart';
// import 'package:vegetable_orders_project/features/products/get_products/get_products_cubit.dart';

// part 'add_remove_favorite_states.dart';

// class AddRemoveFavoriteCubit extends Cubit<AddRemoveFavoriteStates> {
//   AddRemoveFavoriteCubit() : super(AddRemoveFavoriteStates());
//   Map<int, bool> favorite = GetProductCubit.favorites;

//   Future<void> addProduct({required int id}) async {
//     favorite[id] = !favorite[id]!;
//     emit(StartAddSuccessState());
//     final response = await DioHelper()
//         .sendData(endPoint: 'client/products/$id/add_to_favorite');
//     if (response.isSuccess) {
//       GetFavoriteProductCubit().getData();
//       showMessage(
//           message: response.response!.data['message'],
//           type: MessageType.success);
//       emit(AddFavoriteSuccessState());
//     } else {
//       favorite[id] = !favorite[id]!;
//       emit(StartRemoveSuccessState());
//       showMessage(message: 'فشل في إضافة المنتج إلى المفضلة');
//       emit(AddFavoriteFailedState());
//     }
//   }

//   Future<void> removeProduct({required int id}) async {
//     favorite[id] = !favorite[id]!;
//     emit(StartRemoveSuccessState());
//     final response = await DioHelper()
//         .sendData(endPoint: 'client/products/$id/remove_from_favorite');
//     if (response.isSuccess && response.message.isNotEmpty) {
//       showMessage(message: response.message, type: MessageType.success);
//       GetFavoriteProductCubit().getData();
//       emit(RemoveFavoriteSuccessState());
//     } else {
//       favorite[id] = !favorite[id]!;
//       emit(StartAddSuccessState());
//       showMessage(message: 'فشل في إزالة المنتج من المفضلة');
//       emit(RemoveFavoriteFailedState());
//     }
//   }
// }
