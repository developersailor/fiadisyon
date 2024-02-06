import 'package:flutter/material.dart';

class ProductButton extends StatelessWidget {
  const ProductButton({
    required this.child,
    required this.onPressed,
    required this.style,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    super.key,
  });
  final VoidCallback? onPressed;
  final Widget? child;
  final void Function()? onLongPress;
  final void Function({bool isHovered})? onHover;
  final void Function({bool isFocused})? onFocusChange;
  final ButtonStyle? style;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      onHover: (isHovered) => onHover?.call(isHovered: isHovered),
      onFocusChange: (isFocused) => onFocusChange?.call(isFocused: isFocused),
      style: style,
      child: child,
    );
  }
}
