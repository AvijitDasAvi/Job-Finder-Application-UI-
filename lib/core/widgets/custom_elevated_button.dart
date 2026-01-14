import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final EdgeInsets? padding;
  final bool isFullWidth;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFFF7346),
    this.textColor = Colors.white,
    this.fontSize = 13,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = 8,
    this.padding,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 8.r),
        ),
        padding: padding ?? EdgeInsets.symmetric(vertical: 12.h),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: fontSize?.sp ?? 13.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: textColor,
        ),
      ),
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
