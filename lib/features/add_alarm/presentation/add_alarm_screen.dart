import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddAlarmScreen extends StatefulWidget {
  const AddAlarmScreen({Key? key}) : super(key: key);

  @override
  State<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  TextEditingController _titleCtr = TextEditingController();
  DateTime _scheduled = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar alarma')),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ingresa la etiqueta'),
            const SizedBox(height: 5),
            _form(),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (DateTime newTime) {
                  setState(() => _scheduled = newTime);
                },
              ),
            ),
            const SizedBox(height: 40),
            _btn(),
          ],
        ),
      ),
    );
  }

  Widget _form() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(label: Text('Alarma')),
            controller: _titleCtr,
            validator: (String? value) {
              if (value == null && (value != null && value.isEmpty)) {
                return 'Ingresa una etiqueta';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _btn() {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).maybePop({
          "title": _titleCtr.text,
          "scheduled": _scheduled,
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        width: double.infinity,
        height: 50,
        child: const Center(
          child: Text(
            'Guardar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
