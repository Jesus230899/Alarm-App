import 'package:alarma/core/injection/base_injection.dart';
import 'package:alarma/features/home/presentation/bloc/home_bloc.dart';

Future<void> initHomeInjection() async {
  unRegisterServices();

  getIt.registerFactory(() => HomeBloc());
}

void unRegisterServices() {
  removeRegistrationIfExist<HomeBloc>();
}
