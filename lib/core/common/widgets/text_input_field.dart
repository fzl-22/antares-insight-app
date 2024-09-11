import 'package:antares_insight_app/core/extensions/context_extension.dart';
import 'package:antares_insight_app/core/resources/colours.dart';
import 'package:antares_insight_app/core/resources/typographies.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    required this.controller,
    required this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.onEditingComplete,
    super.key,
  }) : isPassword = false;

  const TextInputField.password({
    required this.controller,
    required this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.onEditingComplete,
    super.key,
  }) : isPassword = true;

  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String? value)? validator;
  final Widget? suffixIcon;
  final void Function()? onEditingComplete;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Typographies.semiBold12.copyWith(
            color: Colours.neutral300,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          onEditingComplete: widget.onEditingComplete,
          validator: widget.validator,
          obscureText: widget.isPassword && !_isVisible,
          keyboardType: widget.isPassword
              ? TextInputType.visiblePassword
              : widget.keyboardType,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: Typographies.normal14.copyWith(color: Colours.neutral60),
            alignLabelWithHint: true,
            isDense: true,
            fillColor: Colours.neutral0,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 0, color: Colours.neutral0),
            ),
            suffixIconConstraints: const BoxConstraints(maxHeight: 36),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () => setState(() => _isVisible = !_isVisible),
                    icon: Icon(
                      _isVisible ? IconlyBold.show : IconlyLight.hide,
                      color: context.colorScheme.primary,
                    ),
                  )
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
