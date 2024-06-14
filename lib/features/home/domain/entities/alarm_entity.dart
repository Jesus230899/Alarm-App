import 'package:equatable/equatable.dart';

class AlarmEntity extends Equatable {
  final int id;
  final String title;
  final DateTime scheduled;

  const AlarmEntity({
    required this.id,
    required this.title,
    required this.scheduled,
  });

  @override
  List<Object> get props => [
        id,
        title,
        scheduled,
      ];
}
