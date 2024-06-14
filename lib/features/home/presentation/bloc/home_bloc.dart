import 'package:alarma/features/home/data/models/alarm_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) {
      if (event is AddAlarmEvent) {
        _onAddAlarmEvent(emit, event.value);
      }
      if (event is DeleteAlarmEvent) {
        _onDeleteAlarmEvent(emit, event.value);
      }
    });
  }

  void _onAddAlarmEvent(Emitter emit, AlarmModel value) {
    List<AlarmModel> currentAlarms = [...state.alarms];
    currentAlarms.add(value);

    emit(state.copyWith(alarms: currentAlarms));
  }

  void _onDeleteAlarmEvent(Emitter emit, int value) {
    List<AlarmModel> currentAlarms = [...state.alarms];
    currentAlarms.removeWhere((element) => element.id == value);
    emit(state.copyWith(alarms: currentAlarms));
  }
}
