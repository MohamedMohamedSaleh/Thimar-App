import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/features/get_cities/bloc/get_cities_bloc.dart';
import 'package:vegetable_orders_project/views/auth/login/bloc/login_bloc.dart';
import 'package:vegetable_orders_project/views/auth/register/bloc/register_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/cubit/profile_cubit.dart';

import '../features/categori_products/category_products_cubit.dart';
import '../features/products/search_products/search_products_cubit.dart';
import '../views/auth/confirm_code/cubit/confirm_cubit.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((container) => LoginBloc());
  container.registerFactory((container) => RegisterBloc());
  container.registerFactory((container) => GetCitiesBloc());
  container.registerFactory((container) => ConfirmCubit());

  container.registerFactory((container) => GetCategoryProductsCubit());
  container.registerFactory((container) => GetSearchProductsCubit());

  // container.registerFactory((container) => GetSimilarProductCubit());
  // container.registerFactory((container) => GetSearchCategoryCubit());
  // container.registerFactory((container) => CartCubit());
  container.registerFactory((container) => ProfileCubit());
}
