part of 'get_cities_cubit.dart';

class GetCitiesStates {}

class GetCitiesLoadingState extends GetCitiesStates {}

class GetCitiesFailedState extends GetCitiesStates {}

class GetCitieSuccessState extends GetCitiesStates {
  final List<CityModel> cityData;

  GetCitieSuccessState({required this.cityData});

}
