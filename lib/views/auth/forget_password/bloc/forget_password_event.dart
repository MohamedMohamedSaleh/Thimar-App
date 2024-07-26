part of 'forget_password_bloc.dart';

sealed class ForgetPasswordEvents {}

final class ForgetPasswordEvent extends ForgetPasswordEvents {
  final String phone;
  final bool resend;

  ForgetPasswordEvent({this.resend = false, required this.phone});
}
