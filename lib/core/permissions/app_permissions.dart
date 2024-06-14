import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  static Future<PermissionStatus> notification() async {
    PermissionStatus status = await Permission.notification.status;
    if (status.isDenied || status.isRestricted) {
      final Map<Permission, PermissionStatus> statusses =
          await [Permission.notification].request();
      status = statusses[Permission.notification] ?? PermissionStatus.denied;
    }
    return status;
  }

  static Future<void> checkAndroidScheduleExactAlarm() async {
  final status = await Permission.scheduleExactAlarm.status;
  // print('Schedule exact alarm permission: $status.');
  if (status.isDenied|| status.isRestricted) {
    // print('Requesting schedule exact alarm permission...');
    await Permission.scheduleExactAlarm.request();
    // print(
    //     'Schedule exact alarm permission ${res.isGranted ? '' : 'not'} granted.');
  }
}
}
