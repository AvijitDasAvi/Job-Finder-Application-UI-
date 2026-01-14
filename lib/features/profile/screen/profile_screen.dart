import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/core/widgets/custom_elevated_button.dart';
import 'package:kalmanprojects/features/profile/controller/profile_controller.dart';
import 'package:kalmanprojects/features/profile/widgets/profile_stat_card.dart';
import 'package:kalmanprojects/features/profile/widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with back button
            _buildHeader(profileController),
            // Profile info section
            _buildProfileSection(),
            SizedBox(height: 24.h),
            // Stats cards
            _buildStatsSection(),
            SizedBox(height: 24.h),
            // Post a New Job button
            _buildPostJobButton(profileController),
            SizedBox(height: 24.h),
            // Menu items
            _buildMenuItems(profileController),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ProfileController controller) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.w,
        right: 16.w,
        bottom: 20.h,
      ),
      color: Colors.white,
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
            'Profile',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 40.w), // For spacing balance
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          // Profile image
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              border: Border.all(
                color: Colors.grey[400] ?? Colors.grey,
                width: 2.w,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Image.asset(
                'assets/images/01 Online Shopping 1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          // Name and verified badge
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Theresa Webb',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: const Color(0xFF4CAF50),
                      size: 12.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Verified',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4CAF50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          // Member since and location
          Text(
            'Member since 2023',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Location:Banská Bystrica',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: ProfileStatCard(
              label: 'Active Job',
              value: '3',
              backgroundColor: const Color(0xFFD1E7F1),
              icon: Icons.work_outline,
              iconColor: const Color(0xFF0088CC),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: ProfileStatCard(
              label: 'Completed',
              value: '50',
              backgroundColor: const Color(0xFFE8D5F1),
              icon: Icons.check_circle_outline,
              iconColor: const Color(0xFF8B5CF6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostJobButton(ProfileController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomElevatedButton(
        text: '✏️ Post a New Job',
        onPressed: () => controller.onPostJobTap(),
        backgroundColor: const Color(0xFFFF7346),
        textColor: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        borderRadius: 8,
        isFullWidth: true,
      ),
    );
  }

  Widget _buildMenuItems(ProfileController controller) {
    return Column(
      children: [
        ProfileMenuItem(
          icon: Icons.dashboard_outlined,
          label: 'Overview',
          onTap: () => controller.onOverviewTap(),
          iconColor: Colors.grey[700],
        ),
        ProfileMenuItem(
          icon: Icons.mail_outline,
          label: 'Messages',
          onTap: () => controller.onMessagesTap(),
          iconColor: Colors.grey[700],
        ),
        ProfileMenuItem(
          icon: Icons.work_outline,
          label: 'My Jobs',
          onTap: () => controller.onMyJobsTap(),
          iconColor: Colors.grey[700],
        ),
        ProfileMenuItem(
          icon: Icons.thumb_up_outlined,
          label: 'Proposal',
          onTap: () => controller.onProposalTap(),
          iconColor: Colors.grey[700],
        ),
        ProfileMenuItem(
          icon: Icons.settings_outlined,
          label: 'Settings',
          onTap: () => controller.onSettingsTap(),
          iconColor: Colors.grey[700],
        ),
        ProfileMenuItem(
          icon: Icons.logout,
          label: 'Log Out',
          onTap: () => controller.onLogoutTap(),
          iconColor: const Color(0xFFE74C3C),
          isLogout: true,
        ),
      ],
    );
  }
}
