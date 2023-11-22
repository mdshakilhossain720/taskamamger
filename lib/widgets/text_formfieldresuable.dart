import 'package:flutter/material.dart';
class AppTextFormField extends StatelessWidget {
  final String hintext;
  final TextEditingController controller;
  bool? obscuretext;
  Function(String?)? validator;
  int? maxline;
  AppTextFormField({
    this.validator,
    this.obscuretext,
    required this.controller,required this.hintext,this.maxline,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        validator: (value){
          if(validator!=null){
            validator!(value);
          }
          return null;
        },
        maxLines: maxline ?? 1,
        obscureText: obscuretext ?? false,
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintext,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,

            )
        ),
      ),
    );
  }
}