import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/features/tradesman_profile/screen/reviews_controller.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            _buildHeader(controller),
            SizedBox(height: 24.h),
            // Client Reviews section
            _buildClientReviewsSection(),
            SizedBox(height: 24.h),
            // Filters
            _buildFiltersSection(controller),
            SizedBox(height: 20.h),
            // Individual reviews
            _buildReviewsList(),
            SizedBox(height: 20.h),
            // View All button
            _buildViewAllButton(controller),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ReviewsController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
            'Reviews',
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

  Widget _buildClientReviewsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[200]!, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Client Reviews (127)',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            // Overall rating
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: const Color(0xFFFFC107),
                      size: 20.sp,
                    ),
                    Icon(
                      Icons.star,
                      color: const Color(0xFFFFC107),
                      size: 20.sp,
                    ),
                    Icon(
                      Icons.star,
                      color: const Color(0xFFFFC107),
                      size: 20.sp,
                    ),
                    Icon(
                      Icons.star,
                      color: const Color(0xFFFFC107),
                      size: 20.sp,
                    ),
                    Icon(
                      Icons.star,
                      color: const Color(0xFFFFC107),
                      size: 20.sp,
                    ),
                  ],
                ),
                SizedBox(width: 12.w),
                Text(
                  '4.9',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  '127 reviews',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            // Rating bars
            _buildRatingBar(5, 95),
            SizedBox(height: 12.h),
            _buildRatingBar(4, 75),
            SizedBox(height: 12.h),
            _buildRatingBar(3, 50),
            SizedBox(height: 12.h),
            _buildRatingBar(2, 25),
            SizedBox(height: 12.h),
            _buildRatingBar(1, 10),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBar(int stars, double percentage) {
    return Row(
      children: [
        Row(
          children: List.generate(
            1,
            (_) =>
                Icon(Icons.star, color: const Color(0xFFFFC107), size: 16.sp),
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          '$stars',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 8.h,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                const Color(0xFFFF7346),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        SizedBox(
          width: 40.w,
          child: Text(
            '${percentage.toStringAsFixed(0)}%',
            textAlign: TextAlign.right,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFiltersSection(ReviewsController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.tune, color: Colors.grey[700], size: 18.sp),
              SizedBox(width: 8.w),
              Text(
                'Filters :',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              children: [
                Text(
                  'Recent Reviews',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(Icons.expand_more, color: Colors.grey[700], size: 16.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsList() {
    final reviews = [
      {
        'name': 'Robert Fox',
        'image': 'assets/images/01 Online Shopping 1.png',
        'rating': 5,
        'text':
            'Sarah transformed our outdated kitchen into a modern masterpiece. Excellent communication throughout!',
      },
      {
        'name': 'Robert Fox',
        'image': 'assets/images/01 Online Shopping 1.png',
        'rating': 5,
        'text':
            'Sarah transformed our outdated kitchen into a modern masterpiece. Excellent communication throughout!',
      },
      {
        'name': 'Robert Fox',
        'image': 'assets/images/01 Online Shopping 1.png',
        'rating': 5,
        'text':
            'Sarah transformed our outdated kitchen into a modern masterpiece. Excellent communication throughout!',
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: List.generate(
          reviews.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _buildReviewCard(
              reviews[index]['name'].toString(),
              reviews[index]['image'].toString(),
              reviews[index]['rating'] as int,
              reviews[index]['text'].toString(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard(String name, String image, int rating, String text) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[200]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviewer info
          Row(
            children: [
              // Profile image
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 12.w),
              // Name and rating
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: List.generate(
                      rating,
                      (_) => Icon(
                        Icons.star,
                        color: const Color(0xFFFF7346),
                        size: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Review text
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[700],
              height: 1.5,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildViewAllButton(ReviewsController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GestureDetector(
        onTap: () => controller.onViewAllTap(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]!, width: 1.5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Text(
              'View All',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
