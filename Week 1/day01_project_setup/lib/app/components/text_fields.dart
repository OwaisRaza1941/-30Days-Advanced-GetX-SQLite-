import 'package:flutter/material.dart';

SizedBox textFields({
  required String hintText,
  required TextEditingController controller,
}) {
  return SizedBox(
    width: 320,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    ),
  );
}
