part of 'contact_us_bloc.dart';

sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}
final class ContactUsLoading extends ContactUsState {}
final class ContactUsSuccess extends ContactUsState {}
final class ContactUsFailed extends ContactUsState {}
