part of 'change_password_bloc.dart';

class ChangePasswordEvents {}

class CheckCodeEvent extends ChangePasswordEvents {
  final String phone;

  CheckCodeEvent({required this.phone});
}
class ResetPasswordEvent extends ChangePasswordEvents {
  final String phone;

  ResetPasswordEvent({required this.phone});
}
