import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumInput extends StatelessWidget {
  const PhoneNumInput({Key? key, this.validator, required this.initialValue, this.phoneController, this.onInputChanged}) : super(key: key);

  final String? Function(String?)? validator;
  final PhoneNumber initialValue;
  final TextEditingController? phoneController;
  final void Function(PhoneNumber)? onInputChanged;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: onInputChanged,
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DROPDOWN,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: initialValue,
      textFieldController: phoneController,
      inputBorder: const OutlineInputBorder(),
      inputDecoration: const InputDecoration(
        hintText: 'Phone Number',
      ),
      validator: validator,
    );
  }
}
