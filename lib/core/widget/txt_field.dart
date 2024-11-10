
import 'package:flutter/material.dart';

import '../theme/color_pallete.dart';

class TxtField extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? bgColor;
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIconButton;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final Color? borderColor;

  const TxtField({
    super.key,
    required this.hintText,
    required this.controller,
    this.height,
    this.width,
    this.bgColor,
    this.prefixIcon,
    this.suffixIconButton,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        keyboardType: keyboardType,
        validator: validator,
        maxLength: maxLength,
        maxLines: maxLines,
        style: TextStyle(
          color: Theme.of(context).textTheme.displayLarge!.color,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: (Theme.of(context).scaffoldBackgroundColor ==
                  AppColorPallete.backgroundColor)
              ? AppColorPallete.backgroundColor
              : Colors.grey[200],
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIconButton,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColorPallete.greyColor200,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 2, color: AppColorPallete.greyColor200),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
