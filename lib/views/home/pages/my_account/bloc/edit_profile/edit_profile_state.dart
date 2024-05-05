part of 'edit_profile_bloc.dart';

sealed class EditDataStates {}

final class EditDataInitial extends EditDataStates {}

class EditProfileDataLoadingState extends EditDataStates {}

class EditProfileDataFailedState extends EditDataStates {}

class EditProfileDataSuccessState extends EditDataStates {}
