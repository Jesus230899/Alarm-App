import 'package:alarma/core/injection/base_injection.dart';
import 'package:alarma/core/permissions/app_permissions.dart';
import 'package:alarma/main_common.dart';
import 'package:flutter/material.dart';
import 'package:alarm/alarm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  await Alarm.init();
  AppPermissions.checkAndroidScheduleExactAlarm();
  AppPermissions.notification();
  runApp(const MyApp());
}
