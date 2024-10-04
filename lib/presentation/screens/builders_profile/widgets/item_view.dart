import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.fullWidth *.3,
      height: context.fullHeight *.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
