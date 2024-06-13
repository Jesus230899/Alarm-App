import 'package:get_it/get_it.dart';
import 'dart:async';

final getIt = GetIt.instance;

Future<void> injectDependencies() async{
  getIt.pushNewScope();
  
}
void removeRegistrationIfExist<T extends Object>({String? instance}){
  if(getIt.isRegistered<T>(instance: instance)){
    getIt.unregister<T>(instance: instance);
  }
}