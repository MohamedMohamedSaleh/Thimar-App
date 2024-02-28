import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/features/cart/cart_cubit.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/cubit/profile_cubit.dart';

import '../features/categori_products/category_products_cubit.dart';
import '../features/get_cities/cubit/get_cities_cubit.dart';
import '../features/products/search_products/search_products_cubit.dart';
import '../views/auth/confirm_code/cubit/confirm_cubit.dart';
import '../views/auth/login/cubit/login_cubit.dart';
import '../views/auth/register/cubit/register_cubit.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((container) => LoginCubit());
  container.registerFactory((container) => RegisterCubit());
  container.registerFactory((container) => GetCitiesCubit());
  container.registerFactory((container) => ConfirmCubit());

  container.registerFactory((container) => GetCategoryProductsCubit());
  container.registerFactory((container) => GetSearchProductsCubit());

  // container.registerFactory((container) => GetSimilarProductCubit());
  // container.registerFactory((container) => GetSearchCategoryCubit());
  // container.registerFactory((container) => CartCubit());
  container.registerFactory((container) => ProfileCubit());
}
