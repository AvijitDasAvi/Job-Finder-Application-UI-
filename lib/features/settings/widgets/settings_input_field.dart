import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsInputField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Function(String) onChanged;
  final int maxLines;
  final String? hintText;

  const SettingsInputField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.maxLines = 1,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: TextEditingController(text: initialValue),
          onChanged: onChanged,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText ?? label,
            hintStyle: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
          ),
          style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.black),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
