part of 'change_password_bloc.dart';

class ChangePasswordStates {}

final class CheckCodeLoadingState extends ChangePasswordStates {}
final class CheckCodeSuccessState extends ChangePasswordStates {}
final class CheckCodeFailedState extends ChangePasswordStates {}


final class ResetPasswordLoadingState extends ChangePasswordStates {}
final class ResetPasswordSuccessState extends ChangePasswordStates {}
final class ResetPasswordFailedState extends ChangePasswordStates {}
