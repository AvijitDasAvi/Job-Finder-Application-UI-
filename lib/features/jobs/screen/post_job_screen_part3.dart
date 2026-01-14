import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/core/widgets/custom_elevated_button.dart';
import 'package:kalmanprojects/features/jobs/controller/post_job_controller.dart';

class PostJobScreenPart3 extends StatelessWidget {
  const PostJobScreenPart3({super.key});

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
                    // Photos Section
                    _buildPhotosSection(controller),
                    SizedBox(height: 24.h),
                    // Contact Preference Section
                    _buildContactPreferenceSection(controller),
                    SizedBox(height: 24.h),
                    // Job Summary Section
                    _buildJobSummarySection(controller),
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
            'Photos & Preview',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Step 3 of 3 : Add the finishing touches',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 12.h),
          _buildSegmentedProgress(3),
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

  Widget _buildPhotosSection(PostJobController controller) {
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
                child: Icon(Icons.image, color: Color(0xFFFF7346), size: 28.sp),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Photos & Final Details',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Add photos to help tradespeople understand the job better',
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
        // Photo upload area
        GestureDetector(
          onTap: () => controller.onUploadPhotos(),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 32.h),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.grey[400],
                  size: 40.sp,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Drop photos here or click to browse',
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Up to 5 photos, max file size 10 MB',
                  style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactPreferenceSection(PostJobController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How would you like to be contacted?',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        // Phone only option
        Obx(
          () => GestureDetector(
            onTap: () => controller.selectContactPreference('phone'),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: controller.selectedContactPreference.value == 'phone'
                    ? Colors.white
                    : Colors.grey[50],
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: controller.selectedContactPreference.value == 'phone'
                      ? Colors.grey[300]!
                      : Colors.grey[200]!,
                ),
              ),
              child: Row(
                children: [
                  Text('☎️', style: TextStyle(fontSize: 24.sp)),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone only',
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Tradespeople will call you directly',
                          style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            controller.selectedContactPreference.value ==
                                'phone'
                            ? Color(0xFFFF7346)
                            : Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: controller.selectedContactPreference.value == 'phone'
                        ? Center(
                            child: Container(
                              width: 10.w,
                              height: 10.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFFF7346),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        // Email only option
        Obx(
          () => GestureDetector(
            onTap: () => controller.selectContactPreference('email'),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: controller.selectedContactPreference.value == 'email'
                    ? Colors.white
                    : Colors.grey[50],
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: controller.selectedContactPreference.value == 'email'
                      ? Colors.grey[300]!
                      : Colors.grey[200]!,
                ),
              ),
              child: Row(
                children: [
                  Text('✉️', style: TextStyle(fontSize: 24.sp)),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email only',
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Receive quotes and messages via email',
                          style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            controller.selectedContactPreference.value ==
                                'email'
                            ? Color(0xFFFF7346)
                            : Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: controller.selectedContactPreference.value == 'email'
                        ? Center(
                            child: Container(
                              width: 10.w,
                              height: 10.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFFF7346),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJobSummarySection(PostJobController controller) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[200]!),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with edit button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.description, color: Colors.grey[600], size: 18.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Job Summary',
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => controller.onEditJobSummary(),
                child: Icon(Icons.edit, color: Color(0xFFFF7346), size: 18.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Job Title
          Text(
            'Job Title : asdsadsa',
            style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.black),
          ),
          SizedBox(height: 12.h),
          // Service Category
          Text(
            'Service Category',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 8.w,
            children: [
              _buildSummaryTag('Home Improvement'),
              Text(
                '»',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: Color(0xFFFF7346),
                ),
              ),
              _buildSummaryTag('Cleaning'),
            ],
          ),
          SizedBox(height: 16.h),
          // Date & Timeline
          Text(
            'Date & Timeline',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 8.w,
            children: [
              _buildSummaryTag('Flexible'),
              _buildSummaryTag('Preferred time anytime'),
            ],
          ),
          SizedBox(height: 16.h),
          // Location
          Text(
            'Location',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.grey[600], size: 14.sp),
              SizedBox(width: 4.w),
              Text(
                'Location:Banská Bystrica',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 11.sp, color: Colors.black),
      ),
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
            text: 'Post Job',
            onPressed: () => controller.onPostJobTap(),
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
