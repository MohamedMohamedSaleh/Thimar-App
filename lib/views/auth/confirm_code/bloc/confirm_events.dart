part of 'confirm_bloc.dart';

class ConfirmEvents {}

class ConfirmEvent extends ConfirmEvents {
  final String phone;

  ConfirmEvent({required this.phone});
}
