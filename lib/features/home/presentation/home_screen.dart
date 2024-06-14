import 'dart:developer';
import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path_provider/path_provider.dart';

enum TtsState { playing, stopped, paused, continued }

@RoutePage()
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FlutterTts flutterTts;

  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  TtsState ttsState = TtsState.stopped;

  bool get isPlaying => ttsState == TtsState.playing;
  bool get isStopped => ttsState == TtsState.stopped;
  bool get isPaused => ttsState == TtsState.paused;
  bool get isContinued => ttsState == TtsState.continued;

  @override
  void initState() {
    flutterTts = FlutterTts();
    Alarm.ringStream.stream.listen((settigns) {
  
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        floatingActionButton: _floating(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Mis alarmas'),
    );
  }

  Widget _floating() {
    return FloatingActionButton(
      onPressed: () {
        _speak();
      },
      child: const Icon(Icons.add),
    );
  }

  Future _speak() async {
    await flutterTts.setLanguage('es-MX');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    final time = DateTime.now().add(const Duration(seconds: 10));
    var result =
        await flutterTts.speak("Son las ${time.hour} con ${time.minute}");

    if (result == 1) setState(() => ttsState = TtsState.playing);

    log(result.toString());

    Directory appDirectory = await getApplicationDocumentsDirectory();
    String appPath = appDirectory.path;
    String path = '$appPath/${time.hour}${time.minute}.wav';
    // Verifica si el archivo ya existe
    File audioFile = File(path);
    if (await audioFile.exists()) {
      // Si el archivo existe, elimínalo
      await audioFile.delete();
    }
    final resultAudio = await flutterTts.synthesizeToFile(
      "Son las ${time.hour} con ${time.minute}",
      path,
    );
    log(resultAudio.toString());

    await _alarmConfig(time, path);
    if (await audioFile.exists()) {
    } else {
      log('No existe');
    }
    // print("Audio file saved at: $path");
  }

  // Future _stop() async {
  //   var result = await flutterTts.stop();
  //   if (result == 1) setState(() => ttsState = TtsState.stopped);
  // }

  Future<void> _alarmConfig(DateTime time, String path) async {
    final alarmSettings = AlarmSettings(
      id: 42,
      dateTime: time,
      assetAudioPath: path,
      loopAudio: false,
      vibrate: true,
      volume: 0.8,
      fadeDuration: 3.0,
      notificationTitle: 'This is the title',
      notificationBody: 'This is the body',
      enableNotificationOnKill: Platform.isIOS,
    );
    await Alarm.set(alarmSettings: alarmSettings);
  }
}
