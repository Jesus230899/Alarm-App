import 'package:alarm/core/injection/base_injection.dart';
import 'package:alarm/main_common.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const MyApp());
}