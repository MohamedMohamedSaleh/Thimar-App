// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vegetable_orders_project/core/logic/dio_helper.dart';

// import 'get_favorite_products_model.dart';




// part 'get_favorite_products_state.dart';


// class GetFavoriteProductCubit extends Cubit<GetFavoriteProductStates> {
//   GetFavoriteProductCubit() : super(GetFavoriteProductStates());
//   Future<void> getData() async {
//     emit(GetFavoriteProductLoadingState());
//     final response = await DioHelper().getData(endPoint: 'client/products/favorites');
//     if (response.isSuccess) {
//       final model = FavoriteProductsData.fromJson(response.response!.data);
//       emit(GetFavoriteProductSuccrssState(model: model.list));
//     } else {
//       print(response.response!.data.toString());

//       emit(GetFavoriteProductfailedState(msg: response.message));
//     }
//   }
// }
