part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitialState extends NotificationState {}
final class NotificationReceivedState extends NotificationState {

  final String? title;
  final String? body;

  NotificationReceivedState({this.title, this.body});
}
final class NotificationTokenState extends NotificationState {

  final String? token;

  NotificationTokenState({this.token});
}
