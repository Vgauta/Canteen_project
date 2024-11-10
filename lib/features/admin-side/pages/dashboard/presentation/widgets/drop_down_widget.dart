import 'package:flutter/material.dart';

import '../../../../../../core/theme/color_pallete.dart';
import '../../../../../../core/widget/small_text.dart';

class DropDownWidget extends StatelessWidget {
  final List list;
  final Function()? onPressed;
  final Function(dynamic) onChanged;
  final String validatorText;
  final IconData suffixIcon;
  final String hintText;
  final bool? editOn;

  const DropDownWidget({
    super.key,
    required this.list,
    this.onPressed,
    required this.onChanged,
    required this.validatorText,
    required this.suffixIcon,
    required this.hintText,
    this.editOn = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: Theme.of(context).scaffoldBackgroundColor ==
              AppColorPallete.backgroundColor
          ? AppColorPallete.backgroundColor
          : AppColorPallete.greyColor200,
      borderRadius: BorderRadius.circular(8),
      hint: SmallText(
        text: hintText,
        color: Theme.of(context).hintColor,
      ),
      validator: (val) {
        if (val == null) {
          return "$validatorText is required";
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: editOn!
            ? IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.edit),
              )
            : null,
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor ==
                AppColorPallete.backgroundColor
            ? AppColorPallete.backgroundColor
            : AppColorPallete.greyColor200,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColorPallete.greyColor200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColorPallete.greyColor200,
            width: 2,
          ),
        ),
      ),
      
      items: list
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: SmallText(
                text: e.toString(),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,

    );
  }
}
