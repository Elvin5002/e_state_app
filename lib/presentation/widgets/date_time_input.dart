import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DateTimeInput extends StatelessWidget {
  DateTimeInput({super.key, required this.controller, this.readOnly = false});

  final TextEditingController controller;
  final bool readOnly;

  DateTime selectedDateTime = DateTime.now();

  Future<void> selectDateTime({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2000),
      initialDate: selectedDateTime,
    );

    if (pickedDate == null) return;
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDateTime),
    );

    if (pickedTime == null) return;
    selectedDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    controller.text = DateFormat('dd.MM.yyyy HH:mm').format(selectedDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      keyboardType: TextInputType.datetime,
      onTap: () => readOnly? null: selectDateTime(context: context),
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        labelText: 'Observation time',
        labelStyle: Theme.of(context).textTheme.labelMedium,
        border: Theme.of(context).inputDecorationTheme.border,
        suffixIcon: const Icon(Icons.date_range_rounded),
        alignLabelWithHint: true,
      ),
    );
  }
}