part of 'notifications_bloc.dart';

abstract class NotificationsStates {}

final class NotificationsInitial extends NotificationsStates {}

final class GetNotificationsLoading extends NotificationsStates {}

final class GetNotificationsSuccess extends NotificationsStates {}

final class GetNotificationsFailed extends NotificationsStates {}
final class GetNotificationsEmpty extends NotificationsStates {}
