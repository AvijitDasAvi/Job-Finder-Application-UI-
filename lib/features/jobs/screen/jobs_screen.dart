import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/features/jobs/controller/jobs_controller.dart';
import 'package:kalmanprojects/features/jobs/widgets/job_card.dart';
import 'package:kalmanprojects/features/jobs/screen/jobs_filter_screen.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobsController = Get.put(JobsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Column(
                children: [
                  // Header with back button and title
                  _buildHeader(jobsController),
                  SizedBox(height: 16.h),
                  // Search bar
                  _buildSearchBar(jobsController),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            // Browse Popular Jobs section
            _buildSectionHeader(),
            SizedBox(height: 12.h),
            // Job cards list
            _buildJobsList(jobsController),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(JobsController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => controller.onBackTap(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8.w),
              child: Icon(
                Icons.arrow_back,
                color: Colors.grey[800],
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Text(
            'Find Jobs',
            style: GoogleFonts.poppins(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(JobsController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44.h,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(95.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[600], size: 20.sp),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.grey[600],
                          fontSize: 14.sp,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: GoogleFonts.poppins(fontSize: 14.sp),
                      onChanged: (value) => controller.onSearchChanged(value),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () => Get.to(() => const JobsFilterScreen()),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(10.w),
              child: Icon(Icons.filter_list, color: Colors.white, size: 20.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse Popular Jobs',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Available Jobs (30)',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobsList(JobsController controller) {
    final jobs = [
      {
        'title': 'Emergency Boiler Repair',
        'description':
            'Certified electrician offering residential and commercial electrical services. Quick response time and quality workmanship guaranteed.',
        'clientName': 'John Smith',
        'distance': '1.8 miles away',
        'date': '24/01/2024',
        'timeframe': 'ASAP',
        'applicants': 2,
      },
      {
        'title': 'Bathroom Tiling Repair',
        'description':
            'Certified electrician offering residential and commercial electrical services. Quick response time and quality workmanship guaranteed.',
        'clientName': 'Jane Cooper',
        'distance': '1.8 miles away',
        'date': '24/01/2024',
        'timeframe': 'ASAP',
        'applicants': 2,
      },
      {
        'title': 'Garden Landscaping Project',
        'description':
            'Certified electrician offering residential and commercial electrical services. Quick response time and quality workmanship guaranteed.',
        'clientName': 'Kathryn Murphy',
        'distance': '1.8 miles away',
        'date': '24/01/2024',
        'timeframe': 'ASAP',
        'applicants': 2,
      },
      {
        'title': 'Emergency Boiler Repair',
        'description':
            'Certified electrician offering residential and commercial electrical services. Quick response time and quality workmanship guaranteed.',
        'clientName': 'Jane Cooper',
        'distance': '1.8 miles away',
        'date': '24/01/2024',
        'timeframe': 'ASAP',
        'applicants': 2,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: List.generate(
          jobs.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: JobCard(
              jobTitle: jobs[index]['title'].toString(),
              description: jobs[index]['description'].toString(),
              clientName: jobs[index]['clientName'].toString(),
              distance: jobs[index]['distance'].toString(),
              date: jobs[index]['date'].toString(),
              timeframe: jobs[index]['timeframe'].toString(),
              applicantsCount: int.parse(jobs[index]['applicants'].toString()),
              onSendProposal: () =>
                  controller.onSendProposalTap(jobs[index]['title'].toString()),
            ),
          ),
        ),
      ),
    );
  }
}
