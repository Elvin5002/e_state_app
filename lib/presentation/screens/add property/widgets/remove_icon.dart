import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RemoveIcon extends StatelessWidget {
  const RemoveIcon({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Icon(
        Icons.cancel,
        color: Colors.red,
        size: 20,
      ),
    );
  }
}
