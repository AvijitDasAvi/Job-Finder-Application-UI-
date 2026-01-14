import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/features/services/controller/services_controller.dart';
import 'package:kalmanprojects/features/services/widgets/service_card.dart';
import 'package:kalmanprojects/features/services/screen/service_filter_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesController = Get.put(ServicesController());

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
                  _buildHeader(servicesController),
                  SizedBox(height: 16.h),
                  // Search bar
                  _buildSearchBar(servicesController),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            // Browse Popular Services section
            _buildSectionHeader(),
            SizedBox(height: 12.h),
            // Service cards list
            _buildServicesList(servicesController),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ServicesController controller) {
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
            'Find Services',
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

  Widget _buildSearchBar(ServicesController controller) {
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
            onTap: () => Get.to(() => const ServiceFilterScreen()),
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
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse Popular Services',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Available Tradespeople (30)',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesList(ServicesController controller) {
    final services = [
      {
        'name': 'Ronald Higgins',
        'category': 'Plumber',
        'location': 'in the UK',
        'hourlyRate': 20.0,
        'rating': 5.0,
        'workType': 'Full Time',
        'imageUrl': 'assets/images/Rectangle 7233.png',
      },
      {
        'name': 'Wade Warren',
        'category': 'Handyman',
        'location': 'in the UK',
        'hourlyRate': 30.0,
        'rating': 5.0,
        'workType': 'Part Time',
        'imageUrl': 'assets/images/Rectangle 7233 (2).png',
      },
      {
        'name': 'Jacob Jones',
        'category': 'Interior Designer',
        'location': 'in the UK',
        'hourlyRate': 50.0,
        'rating': 5.0,
        'workType': 'Part Time',
        'imageUrl': 'assets/images/Rectangle 7233 (3).png',
      },
      {
        'name': 'Ronald Higgins',
        'category': 'Electrician',
        'location': 'in the UK',
        'hourlyRate': 40.0,
        'rating': 5.0,
        'workType': 'Part Time',
        'imageUrl': 'assets/images/Rectangle 7233 (4).png',
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: List.generate(
          services.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: ServiceCard(
              name: services[index]['name'].toString(),
              category: services[index]['category'].toString(),
              location: services[index]['location'].toString(),
              hourlyRate: double.parse(
                services[index]['hourlyRate'].toString(),
              ),
              rating: double.parse(services[index]['rating'].toString()),
              workType: services[index]['workType'].toString(),
              imageUrl: services[index]['imageUrl'].toString(),
              onSendInvitation: () => controller.onSendInvitationTap(
                services[index]['name'].toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
