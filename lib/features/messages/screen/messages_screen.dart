import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/features/messages/controller/messages_controller.dart';
import 'package:kalmanprojects/features/messages/widgets/message_list_item.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messagesController = Get.put(MessagesController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(messagesController),
            SizedBox(height: 16.h),
            _buildSearchSection(messagesController),
            SizedBox(height: 16.h),
            _buildMessagesList(messagesController),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(MessagesController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => controller.onBackTap(),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
              ),
            ),
          ),
          Text(
            'Messages',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 40.w),
        ],
      ),
    );
  }

  Widget _buildSearchSection(MessagesController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: TextField(
          onChanged: (value) => controller.onSearchChanged(value),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[600],
              size: 20.sp,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          style: GoogleFonts.poppins(fontSize: 14.sp),
        ),
      ),
    );
  }

  Widget _buildMessagesList(MessagesController controller) {
    final messages = [
      {
        'name': 'Kate Morrison',
        'lastMessage': 'You: I will send you...',
        'image': 'assets/images/01 Online Shopping 1.png',
        'isOnline': true,
      },
      {
        'name': 'Jane Cooper',
        'lastMessage': 'You: I will send you...',
        'image': 'assets/images/01 Online Shopping 1.png',
        'isOnline': true,
      },
      {
        'name': 'Albert Flores',
        'lastMessage': 'You: I will send you...',
        'image': 'assets/images/01 Online Shopping 1.png',
        'isOnline': false,
      },
      {
        'name': 'Kristin Watson',
        'lastMessage': 'You: I will send you...',
        'image': 'assets/images/01 Online Shopping 1.png',
        'isOnline': true,
      },
    ];

    return Column(
      children: messages
          .map(
            (message) => MessageListItem(
              name: message['name'] as String,
              lastMessage: message['lastMessage'] as String,
              imageUrl: message['image'] as String,
              isOnline: message['isOnline'] as bool,
              onTap: () => controller.onMessageTap(message['name'] as String),
              onOptionsTap: () => controller.onMessageOptionsTap(),
            ),
          )
          .toList(),
    );
  }
}
