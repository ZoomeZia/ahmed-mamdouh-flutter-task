import 'package:flutter/material.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// Defines what kind of button to render.
enum ButtonType { filled, text }

class AppButton extends StatelessWidget {
  final ButtonType type;
  final double borderRadius;
  final BorderSide? borderSide;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;

  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;

  final Widget? icon;
  final String? text;
  final Widget? child;
  final TextStyle? textStyle;

  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isBackgroundPrimary;

  const AppButton({
    super.key,
    this.type = ButtonType.filled,
    this.borderRadius = 12.0,
    this.borderSide,
    this.backgroundColor,
    this.boxShadow,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.icon,
    this.text,
    this.child,
    this.textStyle,
    this.onPressed,
    this.isLoading = false,
    this.isBackgroundPrimary = true,
  });

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultBg =
        backgroundColor ??
        (type == ButtonType.filled
            ? ColorsManager.blueColor
            : Colors.transparent);

    final defaultTextColor = (type == ButtonType.filled)
        ? ColorsManager.whiteColor
        : ColorsManager.blueColor;

    final effectiveTextStyle =
        textStyle ??
        theme.textTheme.labelLarge?.copyWith(color: defaultTextColor);

    final buttonContent = isLoading
        ? LoadingAnimationWidget.fallingDot(
            color: isBackgroundPrimary
                ? ColorsManager.whiteColor
                : ColorsManager.blueColor,
            size: 26,
          )
        : child ??
              Stack(
                alignment: Alignment.center,
                children: [
                  if (text != null)
                    Text(
                      text!,
                      style: effectiveTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  if (icon != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 8),
                        child: icon,
                      ),
                    ),
                ],
              );

    final buttonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (type == ButtonType.text) return Colors.transparent;
        if (states.contains(WidgetState.disabled)) {
          return defaultBg.withValues(alpha: 0.6);
        }
        return defaultBg;
      }),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: borderSide ?? BorderSide.none,
        ),
      ),
      padding: WidgetStateProperty.all(padding),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return (type == ButtonType.text)
              ? ColorsManager.blueColor.withValues(alpha: 0.1)
              : Colors.black12;
        }
        return null;
      }),
    );

    final buttonWidget = (type == ButtonType.filled)
        ? ElevatedButton(
            style: buttonStyle,
            onPressed: _isDisabled ? null : onPressed,
            child: buttonContent,
          )
        : TextButton(
            style: buttonStyle,
            onPressed: _isDisabled ? null : onPressed,
            child: buttonContent,
          );

    return Container(
      decoration: boxShadow != null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: boxShadow,
            )
          : null,
      child: (width != null || height != null)
          ? SizedBox(width: width, height: height, child: buttonWidget)
          : buttonWidget,
    );
  }
}
