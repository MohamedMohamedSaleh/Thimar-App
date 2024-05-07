part of 'edit_password_bloc.dart';

abstract class EditPasswordStates {}

final class EditPasswordInitial extends EditPasswordStates {}
final class EditPasswordLoading extends EditPasswordStates {}
final class EditPasswordSuccess extends EditPasswordStates {}
final class EditPasswordFailed extends EditPasswordStates {}
