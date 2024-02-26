part of 'profile_cubit.dart';

class ProfileStates {}

class GetProfileDataSuccessState extends ProfileStates {
  final Data data;

  GetProfileDataSuccessState({required this.data});
}

class GetProfileDataFailedState extends ProfileStates {}

class GetProfileDataLoadingState extends ProfileStates {}
