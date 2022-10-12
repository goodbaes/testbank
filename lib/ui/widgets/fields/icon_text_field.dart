import 'package:flutter/material.dart';

class IconTextField extends StatelessWidget {
  const IconTextField({required this.iconData, required this.text, super.key});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.teal.shade200,
            size: 16,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
