part of 'forget_password_bloc.dart';

sealed class ForgetPasswordStates {}

final class ForgetPasswordInitial extends ForgetPasswordStates {}

final class ForgetPasswordLoading extends ForgetPasswordStates {}

final class ForgetPasswordSuccess extends ForgetPasswordStates {}

final class ForgetPasswordFailed extends ForgetPasswordStates {}
