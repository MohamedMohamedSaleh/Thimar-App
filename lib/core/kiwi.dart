import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/features/addresses/get_addresses/get_addresses_bloc.dart';
import 'package:vegetable_orders_project/features/cart/cart_bloc.dart';
import 'package:vegetable_orders_project/features/categoris/bloc/get_category_bloc.dart';
import 'package:vegetable_orders_project/features/get_cities/bloc/get_cities_bloc.dart';
import 'package:vegetable_orders_project/features/products/products/products_bloc.dart';
import 'package:vegetable_orders_project/features/products/search_category/search_category_bloc.dart';
import 'package:vegetable_orders_project/features/products/similar_products/similar_products_bloc.dart';
import 'package:vegetable_orders_project/features/slider/bloc/get_slider_bloc.dart';
import 'package:vegetable_orders_project/views/auth/change_password/bloc/change_password_bloc.dart';
import 'package:vegetable_orders_project/views/auth/confirm_code/bloc/confirm_bloc.dart';
import 'package:vegetable_orders_project/views/auth/login/bloc/login_bloc.dart';
import 'package:vegetable_orders_project/views/auth/register/bloc/register_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/cubit/profile_cubit.dart';

import '../features/categori_products/category_products_bloc.dart';
import '../features/products/search_products/search_products_bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((container) => LoginBloc());
  container.registerFactory((container) => RegisterBloc());
  container.registerFactory((container) => GetCitiesBloc());
  container.registerFactory((container) => ConfirmBloc());
  container.registerSingleton((container) => GetCategoryBloc()..add(GetCategoryEvent()));
  container.registerSingleton((container) => ProductsBloc()..add(GetProductsEvent())..add(GetFavsProductsEvent()));

  container.registerFactory((container) => GetCategoryProductsBloc());
  container.registerFactory((container) => GetSearchProductsBloc());
  container
      .registerSingleton((container) => GetSliderBloc()..add(GetSliderEvent()));
  container.registerFactory((container) => GetSimilarProductBloc());
  container.registerFactory((container) => GetSearchCategoryBloc());
  container.registerSingleton((container) => CartBloc());
  container.registerFactory((container) => ProfileCubit());
  container.registerFactory((container) => ChangePasswordBloc());
  container.registerFactory((container) => GetAddressesBloc());
}
