import 'package:flutter/material.dart';

import '../../data/models/property_model.dart';

class CustomContainer extends StatelessWidget {
  final PropertyModel property;
  final EdgeInsetsGeometry padding;
  final Color color;

  const CustomContainer({super.key, 
    required this.property, // Ensure property is required
    this.padding = const EdgeInsets.all(10.0),
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(property.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('Location: ${property.location}'),
          SizedBox(height: 5),
          Text('Price: \$${property.price}'),
        ],
      ),
    );
  }
}
