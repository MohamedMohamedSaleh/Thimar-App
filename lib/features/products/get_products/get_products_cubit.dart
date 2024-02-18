// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
// import '../products_model.dart';

// part 'get_products_state.dart';

// // enum ProductsType {mainProducts, favoritesProducts}
// class GetProductCubit extends Cubit<GetProductStates> {
//   GetProductCubit() : super(GetProductStates());
//   static  Map<int, bool> favorites = {};
//   Future<void> getData() async {
//     emit(GetProductLoadingState());
//     final response = await DioHelper().getData(endPoint: 'products');
//     if (response.isSuccess) {
//       final model = ProductsData.fromJson(response.response!.data);
//       for (var element in model.list) {
//         favorites.addAll({element.id: element.isFavorite});
//       }

//       emit(GetProductSuccrssState(model: model.list));
//     } else {
//       print(response.response!.data.toString());

//       emit(GetProductfailedState(msg: response.message));
//     }
//   }
// }
