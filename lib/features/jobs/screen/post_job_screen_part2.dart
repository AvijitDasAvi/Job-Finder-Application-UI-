import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/core/widgets/custom_elevated_button.dart';
import 'package:kalmanprojects/features/jobs/controller/post_job_controller.dart';

class PostJobScreenPart2 extends StatelessWidget {
  const PostJobScreenPart2({super.key});

  @override
  Widget build(BuildContext context) {
    late final PostJobController controller;
    try {
      controller = Get.find<PostJobController>();
    } catch (e) {
      controller = Get.put(PostJobController());
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with back button and cancel button
              _buildHeader(controller),
              SizedBox(height: 20.h),
              // Progress section
              _buildProgressSection(controller),
              SizedBox(height: 24.h),
              // Main content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timeline Section
                    _buildTimelineSection(controller),
                    SizedBox(height: 24.h),
                    // Preferred Date Section
                    _buildPreferredDateSection(controller),
                    SizedBox(height: 24.h),
                    // Preferred Time Section
                    _buildPreferredTimeSection(controller),
                    SizedBox(height: 24.h),
                    // Buttons
                    _buildButtonsSection(controller),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(PostJobController controller) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Center(
                child: Icon(Icons.arrow_back, color: Colors.black, size: 20.sp),
              ),
            ),
          ),
          Text(
            'Post a job',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection(PostJobController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Timeline',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Step 2 of 3 : Add the finishing touches',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 12.h),
          _buildSegmentedProgress(2),
        ],
      ),
    );
  }

  Widget _buildSegmentedProgress(int filledSegments) {
    const totalSegments = 3;
    return Row(
      children: List.generate(totalSegments, (index) {
        final isFilled = index < filledSegments;
        final leftMargin = index == 0 ? 0.0 : 4.w;
        final rightMargin = index == totalSegments - 1 ? 0.0 : 4.w;
        return Expanded(
          child: Container(
            height: 6.h,
            margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
            decoration: BoxDecoration(
              color: isFilled ? const Color(0xFFFF7346) : Colors.grey[300],
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTimelineSection(PostJobController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header with icon
        Row(
          children: [
            Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                color: Color(0xFF1A2C4A),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.schedule,
                  color: Color(0xFFFF7346),
                  size: 28.sp,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Timeline',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Let tradespeople know your when you need it done',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        // Timeline question
        Text(
          'When do you need this done?',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        // Timeline options grid
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 1.2,
          children: [
            _buildTimelineCard(
              icon: '🎉',
              title: 'Flexible',
              subtitle: 'within 2 weeks',
              value: 'flexible',
              controller: controller,
            ),
            _buildTimelineCard(
              icon: '📅',
              title: 'Soon',
              subtitle: 'within 1 week',
              value: 'soon',
              controller: controller,
            ),
            _buildTimelineCard(
              icon: '⚠️',
              title: 'Urgent',
              subtitle: 'within 2 days',
              value: 'urgent',
              controller: controller,
            ),
            _buildTimelineCard(
              icon: '🚨',
              title: 'Emergency',
              subtitle: 'ASAP',
              value: 'emergency',
              controller: controller,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimelineCard({
    required String icon,
    required String title,
    required String subtitle,
    required String value,
    required PostJobController controller,
  }) {
    return Obx(() {
      final isSelected = controller.selectedTimeline.value == value;
      return GestureDetector(
        onTap: () => controller.selectTimeline(value),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.grey[50],
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected ? Colors.grey[300]! : Colors.grey[200]!,
              width: isSelected ? 1 : 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(icon, style: TextStyle(fontSize: 32.sp)),
              SizedBox(height: 8.h),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildPreferredDateSection(PostJobController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferred Date (Optional)',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () => controller.onSelectPreferredDate(),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: Colors.grey[400],
                  size: 18.sp,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Obx(
                    () => Text(
                      controller.selectedPreferredDate.value.isEmpty
                          ? 'dd/mm/yy'
                          : controller.selectedPreferredDate.value,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        color: controller.selectedPreferredDate.value.isEmpty
                            ? Colors.grey[400]
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPreferredTimeSection(PostJobController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferred Time (Optional)',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () => controller.onSelectPreferredTime(),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey[400], size: 18.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: Obx(
                    () => Text(
                      controller.selectedPreferredTime.value.isEmpty
                          ? 'Any time'
                          : controller.selectedPreferredTime.value,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        color: controller.selectedPreferredTime.value.isEmpty
                            ? Colors.grey[400]
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey[400],
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonsSection(PostJobController controller) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Get.back(),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey[300]!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            child: Text(
              'Back',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: CustomElevatedButton(
            text: 'Continue',
            onPressed: () => controller.onContinuePart2Tap(),
            backgroundColor: const Color(0xFFFF7346),
            textColor: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            borderRadius: 8,
            isFullWidth: true,
          ),
        ),
      ],
    );
  }
}
