import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/features/services/screen/send_invitation_screen.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  double userRating = 4.0;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button and title
              _buildHeader(),
              SizedBox(height: 20.h),
              // Main images section
              _buildImagesSection(),
              SizedBox(height: 20.h),
              // Service provider info
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProviderInfo(),
                    SizedBox(height: 20.h),
                    _buildPricingSection(),
                    SizedBox(height: 20.h),
                    _buildSkillsSection(),
                    SizedBox(height: 20.h),
                    _buildInviteButton(),
                    SizedBox(height: 20.h),
                    _buildBioSection(),
                    SizedBox(height: 24.h),
                    _buildRatingsSection(),
                    SizedBox(height: 24.h),
                    _buildPortfolioSection(),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
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
            'Details',
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagesSection() {
    return Column(
      children: [
        // Main large image
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              height: 180.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: Image.asset(
                'assets/images/service1.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        // Smaller images row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: List.generate(2, (index) {
              final imagePath = index == 0
                  ? 'assets/images/service2.png'
                  : 'assets/images/service3.png';
              return Expanded(
                child: Container(
                  height: 80.h,
                  margin: EdgeInsets.only(right: index < 1 ? 12.w : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.grey[300],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildProviderInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First row - Profile image and name with badges
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile image
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!, width: 1),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset('assets/images/jane.png', fit: BoxFit.cover),
            ),
            SizedBox(width: 12.w),
            // Name and badges
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Esther Howard',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[900],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: Colors.green[300]!),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 12.sp,
                              color: Colors.green,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'Verified',
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: Colors.red[300]!),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, size: 12.sp, color: Colors.red),
                            SizedBox(width: 4.w),
                            Text(
                              'Top Rated',
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        // Second row - Location and rating
        Row(
          children: [
            Icon(Icons.location_on, size: 14.sp, color: Colors.grey[600]),
            SizedBox(width: 4.w),
            Text(
              'Bratislava, Slovakia',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(width: 12.w),
            Icon(
              Icons.star_rounded,
              size: 14.sp,
              color: const Color(0xFFFF6B35),
            ),
            SizedBox(width: 4.w),
            Text(
              '4.8 ( 170 Reviews)',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPricingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Starting At',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          '\$20.00/hr',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFF6B35),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsSection() {
    final skills = ['Handyman', 'Gardening', 'Renovation'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills and Services',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey[900],
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: List.generate(
            skills.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                right: index < skills.length - 1 ? 12.w : 0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Text(
                  skills[index],
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInviteButton() {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: () => Get.to(() => const SendInvitationScreen()),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
        ),
        child: Text(
          'Invite to project',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildBioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bio',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey[900],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'From daily maintenance to deep cleaning, our office cleaning services are tailored to meet your business needs. We use professional-grade equipment and eco-friendly products to ensure a clean, hygienic, and welcoming environment for your employees and clients.',
          style: GoogleFonts.poppins(
            fontSize: 13.sp,
            color: Colors.grey[700],
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rating & Reviews',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey[900],
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Customers rated this pro highly for work quality, professionalism, and responsiveness.',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
        SizedBox(height: 12.h),
        // Star rating
        Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: Icon(
                Icons.star_rounded,
                color: index < 4 ? const Color(0xFFFF6B35) : Colors.grey[300],
                size: 20.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        // Comment box
        TextField(
          controller: commentController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Type your comment .....',
            hintStyle: GoogleFonts.poppins(
              fontSize: 13.sp,
              color: Colors.grey[600],
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            contentPadding: EdgeInsets.all(12.w),
          ),
          style: GoogleFonts.poppins(fontSize: 13.sp),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          width: 130.w,
          height: 40.h,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
              elevation: 0,
            ),
            child: Text(
              'Send Review',
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        // Reviews list
        _buildReviewItem(
          name: 'Jane Cooper',
          rating: 5,
          comment:
              'Sarah transformed our outdated kitchen into a modern masterpiece. Excellent communication and follow-up!',
          imagePath: 'assets/images/jane.png',
        ),
        SizedBox(height: 16.h),
        _buildReviewItem(
          name: 'John Smith',
          rating: 5,
          comment:
              'The work was completed ahead of schedule and the space looks brand new. Highly recommend!',
          imagePath: 'assets/images/john.png',
        ),
        SizedBox(height: 16.h),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey[400]!, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            child: Text(
              'View All',
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewItem({
    required String name,
    required int rating,
    required String comment,
    String? imagePath,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[300]!, width: 1),
          ),
          clipBehavior: Clip.hardEdge,
          child: imagePath != null
              ? Image.asset(imagePath, fit: BoxFit.cover)
              : const Center(child: Icon(Icons.person, size: 20)),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[900],
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star_rounded,
                    color: index < rating
                        ? const Color(0xFFFF6B35)
                        : Colors.grey[300],
                    size: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                comment,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPortfolioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Portfolio',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey[900],
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: List.generate(
            3,
            (index) => Expanded(
              child: Container(
                height: 100.h,
                margin: EdgeInsets.only(right: index < 2 ? 12.w : 0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const Center(child: Icon(Icons.image, size: 40)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}
