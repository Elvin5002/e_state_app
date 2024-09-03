import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({Key? key, required this.img, required this.onTap}) : super(key: key);

  final String img;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
