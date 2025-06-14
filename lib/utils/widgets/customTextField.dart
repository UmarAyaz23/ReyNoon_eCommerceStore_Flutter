import 'package:ecommerce_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class customTextField extends StatefulWidget{
  final String label;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const customTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    required this.keyboardType,
    required this.isPassword,
    this.controller,
    this.validator,
    this.onChanged
  });

  @override
  State<customTextField> createState() => _customTextFieldState();
}

class _customTextFieldState extends State<customTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      
      style: appTextStyles.withColor(
        appTextStyles.bodyMid, 
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),

      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: appTextStyles.withColor(
          appTextStyles.bodyMid, 
          Colors.grey[600]!
        ),
        prefixIcon: Icon(widget.prefixIcon, color: Colors.grey[600]),
        suffixIcon: widget.isPassword 
          ? IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            )
          : null,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
            )
          ),
      )
    );
  }
}