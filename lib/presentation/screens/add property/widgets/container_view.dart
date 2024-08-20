import 'dart:io';

import 'package:flutter/widgets.dart';

import 'remove_icon.dart';

class ContainerView extends StatelessWidget {
  const ContainerView({Key? key, required this.image, required this.onTap}) : super(key: key);

  final String image; 
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: FileImage(File(image)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: RemoveIcon(
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
