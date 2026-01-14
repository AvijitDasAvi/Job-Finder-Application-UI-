import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String time;
  final bool isMe;
  final String? status;

  const ChatMessage({
    super.key,
    required this.text,
    required this.time,
    required this.isMe,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 280.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isMe ? const Color(0xFFFF7346) : Colors.grey[200],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  color: isMe ? Colors.white : Colors.black,
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: isMe
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    color: Colors.grey[600],
                  ),
                ),
                if (isMe && status != null) ...[
                  SizedBox(width: 4.w),
                  Icon(
                    status == 'read' ? Icons.done_all : Icons.done,
                    color: Colors.grey[600],
                    size: 12.sp,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
