import 'package:alarma/features/home/domain/entities/alarm_entity.dart';

class AlarmModel extends AlarmEntity {
  const AlarmModel({
    required int id,
    required String title,
    required DateTime scheduled,
  }) : super(
          id: id,
          title: title,
          scheduled: scheduled,
        );

  factory AlarmModel.fromJson(Map<String, dynamic> json) {
    return AlarmModel(
      id: json['id'],
      title: json['title'],
      scheduled: json['scheduled'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "scheduled": scheduled,
      };
}
