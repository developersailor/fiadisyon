import 'package:fiadisyon/product/utility/size/icon_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:theme/theme.dart';

class ProductTextFieldDecoration extends InputDecoration {
  ProductTextFieldDecoration(
    BuildContext context,
    String label,
    IconData prefixIcon,
    String? hintText,
  ) : super(
          label: Text(label),
          labelStyle: GoogleFonts.roboto(
            color: MaterialTheme.lightScheme().onSurfaceVariant,
            fontSize: context.sized.dynamicHeight(0.02),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(
            color: MaterialTheme.lightScheme().onSurface.withOpacity(0.5),
            fontSize: GoogleFonts.roboto().fontSize,
          ),
          filled: true,
          fillColor: MaterialTheme.lightScheme().surface,
          border: OutlineInputBorder(
            borderRadius: context.border.lowBorderRadius,
            borderSide: BorderSide(
              color: MaterialTheme.lightScheme().onSurfaceVariant,
              width: context.sized.dynamicWidth(0.01),
            ),
          ),
          contentPadding: context.padding.low,
          prefixIcon: Icon(
            prefixIcon,
            size: IconSize.medium.value,
            color: MaterialTheme.lightScheme().onSurfaceVariant,
          ),
        );
}
