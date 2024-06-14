part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<AlarmModel> alarms;
  final String title;
  final DateTime scheduled;

  const HomeState({
    required this.alarms,
    required this.title,
    required this.scheduled,
  });

  HomeState copyWith({
    List<AlarmModel>? alarms,
    String? title,
    DateTime? scheduled,
  }) =>
      HomeState(
        alarms: alarms ?? this.alarms,
        title: title ?? this.title,
        scheduled: scheduled ?? this.scheduled,
      );

  factory HomeState.initial() => HomeState(
        alarms: const [],
        title: '',
        scheduled: DateTime.now(),
      );

  @override
  List<Object> get props => [
        alarms,
        title,
        scheduled,
      ];
}
