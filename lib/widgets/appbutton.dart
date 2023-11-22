import 'package:flutter/material.dart';
class AppButton extends StatelessWidget {
  final VoidCallback ontap;
  final Widget text;
  const AppButton({
    super.key, required this.ontap, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: ontap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.all(20),
          ),

          child: text),
    );
  }
}