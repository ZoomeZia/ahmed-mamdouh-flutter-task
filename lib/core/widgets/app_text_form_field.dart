import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/core/theming/text_styles.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.maxLines,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly,
    this.onTap,
    this.keyboardType,
    this.validation,
    this.borderColor,
    this.onChanged,
    this.isPassword = false,
    this.inputFormatters,
    this.maxLength,
    this.focusNode,
    this.style,
    this.hintStyle,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.border,
    this.backgroundColor,
    this.errorStyle,
  });
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final bool? obscureText;
  final Widget? suffixIcon, prefixIcon;
  final bool? readOnly;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final String? Function(String?)? validation;
  final Color? borderColor;
  final Function(String)? onChanged;
  final bool isPassword;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final Color? backgroundColor;
  final TextStyle? errorStyle;
  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool viewPassword;
  @override
  void initState() {
    widget.isPassword ? viewPassword = true : viewPassword = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: viewPassword,
      obscuringCharacter: '*',
      maxLines: widget.maxLines ?? 1,
      onChanged: widget.onChanged,
      controller: widget.controller,
      readOnly: widget.readOnly ?? false,
      cursorColor: ColorsManager.blueColor,
      focusNode: widget.focusNode,
      onTap: widget.onTap,
      style: widget.style,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,

      validator:
          widget.validation ??
          (value) {
            if (value == null || value.isEmpty) {
              return widget.hintText ?? 'This field is required';
            }
            return null;
          },

      decoration: InputDecoration(
        isDense: true,

        filled: true,
        errorMaxLines: 2,
        contentPadding:
            widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border:
            widget.border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.borderColor ?? ColorsManager.geryColor,
                width: 1.3,
              ),
            ),
        focusedBorder:
            widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: ColorsManager.blueColor,
                width: 1.3,
              ),
            ),

        enabledBorder:
            widget.enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.borderColor ?? ColorsManager.geryColor,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(12),
        ),

        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    viewPassword = !viewPassword;
                  });
                },
                child: Icon(
                  viewPassword ? Icons.visibility_off : Icons.remove_red_eye,
                  color: ColorsManager.geryColor,
                ),
              )
            : widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        hintStyle:
            widget.hintStyle ??
            TextStyles.font14Regular.copyWith(
              color: ColorsManager.geryColor,
            ),
        hintText: widget.hintText,
        fillColor: widget.backgroundColor ?? ColorsManager.whiteColor,
        errorStyle:
            widget.errorStyle ??
            TextStyles.font12Regular.copyWith(color: Colors.red),

        label: widget.labelText != null
            ? Text(
                widget.labelText!,
                style:
                    widget.style ??
                    TextStyles.font14Regular.copyWith(
                      color: ColorsManager.geryColor,
                    ),
              )
            : null,
      ),
    );
  }
}
