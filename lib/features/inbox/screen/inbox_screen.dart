import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/features/inbox/controller/inbox_controller.dart';
import 'package:kalmanprojects/features/inbox/widgets/chat_message.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({super.key});

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final inboxController = Get.put(InboxController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(inboxController),
          Expanded(child: _buildChatMessages(inboxController)),
          _buildMessageInput(inboxController),
        ],
      ),
    );
  }

  Widget _buildHeader(InboxController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200] ?? Colors.grey,
            width: 1.h,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => controller.onBackTap(),
                child: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
              ),
              SizedBox(width: 12.w),
              Stack(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        'assets/images/01 Online Shopping 1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF4CAF50),
                        border: Border.all(color: Colors.white, width: 2.w),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.userName,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Active now',
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () => controller.onMoreOptionsTap(),
            child: Icon(Icons.more_vert, color: Colors.grey[600], size: 24.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessages(InboxController controller) {
    return Obx(
      () => ListView.builder(
        reverse: true,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        itemCount: controller.messages.length,
        itemBuilder: (context, index) {
          final message =
              controller.messages[controller.messages.length - 1 - index];
          return ChatMessage(
            text: message['text'] as String,
            time: message['time'] as String,
            isMe: message['isMe'] as bool,
            status: message['status'] as String?,
          );
        },
      ),
    );
  }

  Widget _buildMessageInput(InboxController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200] ?? Colors.grey, width: 1.h),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Icon(Icons.add, color: Colors.grey[600], size: 24.sp),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'write your message',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        color: Colors.grey[600],
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    style: GoogleFonts.poppins(fontSize: 13.sp),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () {
                  controller.onSendMessage(messageController.text);
                  messageController.clear();
                },
                child: Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFF7346),
                  ),
                  child: Center(
                    child: Icon(Icons.send, color: Colors.white, size: 20.sp),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }
}
