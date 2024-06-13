import 'package:alarm/core/routes/app_router.dart';
import 'package:alarm/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouter router = AppRouter();
  
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data:MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        // supportedLocales: const [Locale('es', 'MX')],
        routerConfig: router.config(),
        builder: (BuildContext context, Widget?child){
          return const HomeScreen();
        },
      ),
    );
    
  }
}