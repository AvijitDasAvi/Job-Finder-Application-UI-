import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/features/myjobs/controller/myjobs_controller.dart';
import 'package:kalmanprojects/features/myjobs/widgets/myjobs_card.dart';

class MyJobsScreen extends StatelessWidget {
  const MyJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myJobsController = Get.put(MyJobsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(myJobsController),
              SizedBox(height: 20.h),
              _buildSearchAndFilterSection(myJobsController),
              SizedBox(height: 20.h),
              _buildJobsListSection(myJobsController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(MyJobsController controller) {
    return Row(
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
          'My Jobs',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.onPostJobTap(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF7346),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.edit, size: 14.sp, color: Colors.white),
              SizedBox(width: 4.w),
              Text(
                'Post a Job',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchAndFilterSection(MyJobsController controller) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: TextField(
            onChanged: (value) => controller.onSearchChanged(value),
            decoration: InputDecoration(
              hintText: 'Search jobs...',
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
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!, width: 1.w),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Text(
                    'All Categories',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.expand_more, size: 16.sp, color: Colors.grey[600]),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildJobsListSection(MyJobsController controller) {
    final jobs = [
      {
        'title': 'Emergency Boiler Repair',
        'distance': '1.8 miles away',
        'date': '24/01/2024',
        'urgency': 'ASAP',
        'applicants': 8,
      },
      {
        'title': 'Kitchen Cabinet Installation',
        'distance': '1.8 miles away',
        'date': '24/01/2024',
        'urgency': 'ASAP',
        'applicants': 12,
      },
      {
        'title': 'Emergency Boiler Repair',
        'distance': '1.8 miles away',
        'date': '24/01/2024',
        'urgency': 'ASAP',
        'applicants': 13,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: jobs
          .map(
            (job) => MyJobsCard(
              title: job['title'] as String,
              distance: job['distance'] as String,
              date: job['date'] as String,
              urgency: job['urgency'] as String,
              applicants: job['applicants'] as int,
              onViewTap: () => controller.onViewJobTap(),
              onDeleteTap: () => controller.onDeleteJobTap(),
            ),
          )
          .toList(),
    );
  }
}
