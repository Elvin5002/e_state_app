import 'package:flutter/material.dart';
import 'package:e_state_app/data/local/property_model.dart'; // Ensure this path is correct

class CustomContainer extends StatelessWidget {
  final PropertyModel property;
  final EdgeInsetsGeometry padding;
  final Color color;

  CustomContainer({
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
          Text(property.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('Location: ${property.location}'),
          SizedBox(height: 5),
          Text('Price: \$${property.price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
