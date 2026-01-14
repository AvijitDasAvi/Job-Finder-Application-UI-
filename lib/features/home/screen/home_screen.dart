import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/core/widgets/custom_elevated_button.dart';
import 'package:kalmanprojects/core/widgets/custom_bottom_bar.dart';
import 'package:kalmanprojects/features/home/controller/home_controller.dart';
import 'package:kalmanprojects/features/home/widgets/tradesperson_card.dart';
import 'package:kalmanprojects/features/jobs/screen/jobs_screen.dart';
import 'package:kalmanprojects/features/services/screen/services_screen.dart';
import 'package:kalmanprojects/features/profile/screen/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => _getScreenForIndex(
          homeController.currentIndex.value,
          homeController,
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: _buildBottomNavigationBar(homeController),
    );
  }

  Widget _getScreenForIndex(int index, HomeController controller) {
    switch (index) {
      case 0:
        // Home screen
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Column(
              children: [
                // Header with title and notification
                _buildHeader(),
                SizedBox(height: 16.h),
                // Welcome back text and search bar section
                _buildWelcomeAndSearch(controller),
                SizedBox(height: 24.h),
                // Promotional banner
                _buildPromotionalBanner(controller),
                SizedBox(height: 20.h),
                // Home Repairs section - Horizontal scrolling cards
                _buildHomeRepairsCards(),
                SizedBox(height: 24.h),
                // Popular Services section
                _buildSectionTitle('Popular Services', controller),
                SizedBox(height: 12.h),
                _buildServicesSection(),
                SizedBox(height: 24.h),
                // Popular Tradesperson section
                _buildSectionTitle('Popular Tradesperson', controller),
                SizedBox(height: 12.h),
                _buildTradespersonCard(controller),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        );
      case 1:
        // Services screen
        return ServicesScreen();
      case 2:
        // Jobs screen
        return JobsScreen();
      case 3:
        // Profile screen
        return ProfileScreen();
      default:
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Column(
              children: [
                _buildHeader(),
                SizedBox(height: 16.h),
                _buildWelcomeAndSearch(controller),
              ],
            ),
          ),
        );
    }
  }

  Widget _buildHeader() {
    final homeController = Get.find<HomeController>();
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Prava Ruka',
            style: GoogleFonts.poppins(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF7346),
            ),
          ),
          Row(
            children: [
              // Notification icon
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(40.r),
                ),
                padding: EdgeInsets.all(8.w),
                child: SizedBox(
                  width: 15.67.w,
                  height: 17.41.h,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.grey[600],
                    size: 17.41.sp,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              // Plus icon
              GestureDetector(
                onTap: () => homeController.onPostJobTap(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  padding: EdgeInsets.all(8.w),
                  child: SizedBox(
                    width: 15.67.w,
                    height: 17.41.h,
                    child: Icon(
                      Icons.add,
                      color: Colors.grey[600],
                      size: 17.41.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              // Tradesman profile icon
              GestureDetector(
                onTap: () => Get.toNamed('/tradesmanProfile'),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  padding: EdgeInsets.all(8.w),
                  child: SizedBox(
                    width: 15.67.w,
                    height: 17.41.h,
                    child: Icon(
                      Icons.person_search,
                      color: Colors.grey[600],
                      size: 17.41.sp,
                    ),
                  ),
                ),
              ),
              // SizedBox(width: 12.w),
              // // Profile icon - navigate to profile screen via bottom bar
              // GestureDetector(
              //   onTap: () => homeController.updateBottomNavIndex(3),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.grey[100],
              //       borderRadius: BorderRadius.circular(40.r),
              //     ),
              //     padding: EdgeInsets.all(8.w),
              //     child: SizedBox(
              //       width: 15.67.w,
              //       height: 17.41.h,
              //       child: Icon(
              //         Icons.person,
              //         color: Colors.grey[600],
              //         size: 17.41.sp,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeAndSearch(HomeController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome back text - 165x22
          SizedBox(
            width: 165.w,
            height: 22.h,
            child: Text(
              'Welcome back!',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          // Search bar - 390x42
          Container(
            width: 390.w,
            height: 42.h,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(95.r),
            ),
            child: Row(
              children: [
                SizedBox(width: 12.w),
                Icon(Icons.search, color: Color(0xFF36454F), size: 20.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: GoogleFonts.poppins(
                        color: Color(0xFF36454F),
                        fontSize: 12.sp,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    style: GoogleFonts.poppins(fontSize: 14.sp),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.all(8.w),
                  child: SizedBox(
                    width: 23.48.w,
                    height: 23.48.h,
                    child: Image.asset(
                      'assets/images/Vector.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionalBanner(HomeController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        children: [
          Container(
            width: 390.w,
            height: 154.h,
            decoration: BoxDecoration(
              color: Color(0xFFFF7143),
              borderRadius: BorderRadius.circular(16.r),
            ),
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text section
                SizedBox(
                  width: 242.w,
                  height: 58.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hire Trusted Tradesperson',
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Win quality products with easy to\nuse coins.',
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          color: Colors.white70,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  width: 142.w,
                  height: 34.h,
                  child: ElevatedButton(
                    onPressed: () => controller.onPostJobTap(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF36454F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Post a Job Now',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Image positioned on the right and bottom
          Positioned(
            right: 16.w,
            bottom: 0,
            child: Container(
              width: 147.78.w,
              height: 147.78.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Image.asset(
                'assets/images/01 Online Shopping 1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeRepairsCards() {
    final cards = [
      {
        'title': 'Home Repairs',
        'subtitle': 'Plumbing, electrical, carpentry, and more',
        'icon': 'assets/images/frame_home.png',
      },
      {
        'title': 'Cleaning',
        'subtitle': 'House cleaning, washing and more',
        'icon': 'assets/images/frame_cleaning.png',
      },
      {
        'title': 'Painting',
        'subtitle': 'Interior and exterior painting services',
        'icon': '🎨',
      },
      {
        'title': 'Plumbing',
        'subtitle': 'Pipe repair and installation',
        'icon': '🔧',
      },
      {
        'title': 'Electrical',
        'subtitle': 'Wiring and circuit installation',
        'icon': '⚡',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: List.generate(
            cards.length,
            (index) => Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Container(
                width: 250.w,
                height: 66.h,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.all(12.w),
                child: Row(
                  children: [
                    Container(
                      width: 42.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                        color:
                            cards[index]['icon']?.startsWith('assets/') ?? false
                            ? Colors.transparent
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child:
                            cards[index]['icon']?.startsWith('assets/') ?? false
                            ? Image.asset(
                                cards[index]['icon'].toString(),
                                fit: BoxFit.contain,
                                width: 36.sp,
                                height: 36.sp,
                              )
                            : Text(
                                cards[index]['icon'].toString(),
                                style: TextStyle(fontSize: 24.sp),
                              ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cards[index]['title'].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // SizedBox(height: 4.h),
                          Text(
                            cards[index]['subtitle'].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: Colors.black,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, HomeController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          Row(
            children: [
              // Left arrow button (black background)
              GestureDetector(
                onTap: () => controller.onSeeAllTap(title),
                child: Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              // Right arrow button (orange background)
              GestureDetector(
                onTap: () => controller.onSeeAllTap(title),
                child: Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF7346),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.grey[100],
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rectangle image
            Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.grey[300],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  'assets/images/Rectangle 7233.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Gardening & Landscaping',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Keep a spotless home without the effort! Our team offers expert cleaning services to keep your space fresh and hygienic. See our offers',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: 12.h),
            // Divider
            Divider(color: Colors.grey[300], height: 1.h),
            SizedBox(height: 12.h),
            SizedBox(height: 12.h),
            // Bottom section with location, rating and button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey[600],
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'in the UK',
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: const Color(0xFFFF7346),
                          size: 16.sp,
                        ),
                        SizedBox(width: 2.w),
                        Icon(
                          Icons.star,
                          color: const Color(0xFFE74C3C),
                          size: 16.sp,
                        ),
                        SizedBox(width: 2.w),
                        Icon(
                          Icons.star,
                          color: const Color(0xFFE74C3C),
                          size: 16.sp,
                        ),
                        SizedBox(width: 2.w),
                        Icon(
                          Icons.star,
                          color: const Color(0xFFE74C3C),
                          size: 16.sp,
                        ),
                        SizedBox(width: 2.w),
                        Icon(
                          Icons.star,
                          color: const Color(0xFFE74C3C),
                          size: 16.sp,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          '5.0 Rating',
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // Explore button
            CustomElevatedButton(
              text: 'Explore now',
              onPressed: () {},
              backgroundColor: const Color(0xFFFF7346),
              textColor: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              borderRadius: 8,
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTradespersonCard(HomeController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TradespersonCard(
        name: 'Ronald Hughes',
        rating: 4.8,
        reviewCount: 128,
        price: '\$20.00/hr',
        isFullTime: true,
        onTap: () => controller.onSendInvitation(),
      ),
    );
  }

  Widget _buildBottomNavigationBar(HomeController controller) {
    return Obx(
      () => CustomBottomBar(
        selectedIndex: controller.currentIndex.value,
        onItemTapped: (index) => controller.updateBottomNavIndex(index),
        items: [
          BottomBarItem(icon: Icons.home_filled, label: 'Home'),
          BottomBarItem(icon: Icons.design_services, label: 'Services'),
          BottomBarItem(icon: Icons.work_outline, label: 'Jobs'),
          BottomBarItem(icon: Icons.person_outline, label: 'Profile'),
        ],
        backgroundColor: const Color(0xFF2C2C2C),
        activeColor: const Color(0xFFE74C3C),
        inactiveColor: Colors.white,
      ),
    );
  }
}
