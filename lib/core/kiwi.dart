import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/features/addresses/get_delete_addresses/get_delete_addresses_bloc.dart';
import 'package:vegetable_orders_project/features/addresses/set_address/set_address_bloc.dart';
import 'package:vegetable_orders_project/features/cart/cart_bloc.dart';
import 'package:vegetable_orders_project/features/categoris/bloc/get_category_bloc.dart';
import 'package:vegetable_orders_project/features/get_cities/bloc/get_cities_bloc.dart';
import 'package:vegetable_orders_project/features/my_orders/get_my_orders/my_orders_bloc.dart';
import 'package:vegetable_orders_project/features/notifications/notifications_bloc.dart';
import 'package:vegetable_orders_project/features/products/products/products_bloc.dart';
import 'package:vegetable_orders_project/features/products/search_category/search_category_bloc.dart';
import 'package:vegetable_orders_project/features/products/similar_products/similar_products_bloc.dart';
import 'package:vegetable_orders_project/features/slider/bloc/get_slider_bloc.dart';
import 'package:vegetable_orders_project/views/auth/change_password/bloc/change_password_bloc.dart';
import 'package:vegetable_orders_project/views/auth/confirm_code/bloc/confirm_bloc.dart';
import 'package:vegetable_orders_project/views/auth/login/bloc/login_bloc.dart';
import 'package:vegetable_orders_project/views/auth/register/bloc/register_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/edit_password/edit_password_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/get_profile/profile_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/policy_about_terms/policy_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/questions/questions_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/suggestions/suggestions_bloc.dart';

// import '../features/addresses/get_delete_addresses/get_delete_addresses_bloc.dart';
import '../features/categori_products/category_products_bloc.dart';
import '../features/products/search_products/search_products_bloc.dart';
import '../views/home/pages/my_account/bloc/edit_profile/edit_profile_bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((container) => LoginBloc());
  container.registerFactory((container) => RegisterBloc());
  container.registerFactory((container) => GetCitiesBloc());
  container.registerFactory((container) => ConfirmBloc());
  container.registerFactory((container) => EditPasswordBloc());
  container.registerFactory((container) => QuestionsBloc());
  container.registerFactory((container) => PolicyBloc());
  container.registerFactory((container) => SuggestionsBloc());
  container.registerSingleton((container) => SetUpdateAdressBloc());
  container.registerSingleton(
      (container) => GetCategoryBloc()..add(GetCategoryEvent()));
  container.registerSingleton((container) => ProductsBloc()
    ..add(GetProductsEvent())
    ..add(GetFavsProductsEvent(isLoading: true)));
  // container.registerFactory((container) => GetDeleteAddressesBloc());
  // container.registerFactory((container) => TestAddressBloc());
  container.registerSingleton((container) => GetDeleteAddressesBloc());
  container.registerFactory((container) => GetCategoryProductsBloc());
  container.registerSingleton((container) => GetSearchProductsBloc());
  container
      .registerSingleton((container) => GetSliderBloc()..add(GetSliderEvent()));
  container.registerFactory((container) => GetSimilarProductBloc());
  container.registerFactory((container) => GetSearchCategoryBloc());
  container.registerSingleton((container) => CartBloc());
  container.registerSingleton((container) => ProfileBloc());
  container.registerSingleton((container) => EditProfilBloc());
  container.registerSingleton((container) => MyOrdersBloc());
  container.registerFactory((container) => ChangePasswordBloc());
  container.registerFactory((container) => NotificationsBloc());
}
