import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhoneNumInput extends StatelessWidget {
  const PhoneNumInput({super.key, this.validator, required this.initialValue, this.phoneController, this.onInputChanged});

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
      textStyle: Theme.of(context).textTheme.labelMedium,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: Theme.of(context).textTheme.labelLarge,
      initialValue: initialValue,
      textFieldController: phoneController,
      inputBorder: Theme.of(context).inputDecorationTheme.border,
      inputDecoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.phoneNO,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle
      ),
      validator: validator,
    );
  }
}
