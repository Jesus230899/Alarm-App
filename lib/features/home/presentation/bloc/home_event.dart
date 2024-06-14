part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTitleEvent extends HomeEvent {
  final String value;
  const ChangeTitleEvent({required this.value});
  @override
  List<Object> get props => [value];
}

class ChangeScheduledEvent extends HomeEvent {
  final DateTime value;
  const ChangeScheduledEvent({required this.value});
  @override
  List<Object> get props => [value];
}

class AddAlarmEvent extends HomeEvent {
  final AlarmModel value;
  const AddAlarmEvent({required this.value});
  @override
  List<Object> get props => [value];
}

class DeleteAlarmEvent extends HomeEvent {
  final int value;
  const DeleteAlarmEvent({required this.value});
  @override
  List<Object> get props => [value];
}
