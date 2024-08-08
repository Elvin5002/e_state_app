import 'package:e_state_app/screens/widgets/custom_button.dart';
import 'package:e_state_app/screens/widgets/custom_input.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(child: CustomInput(obscureText: false)),
      ),
    );
  }
}