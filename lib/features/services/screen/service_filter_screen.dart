import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceFilterScreen extends StatefulWidget {
  const ServiceFilterScreen({super.key});

  @override
  State<ServiceFilterScreen> createState() => _ServiceFilterScreenState();
}

class _ServiceFilterScreenState extends State<ServiceFilterScreen> {
  String? selectedSortBy = 'My qualifications';
  String? selectedCategory = 'Cleaning Services';
  String? selectedSubCategory = 'Cleaning';
  String zipCode = '';

  // Rating filter states
  bool rating5Star = false;
  bool rating4Star = false;
  bool rating3Star = false;
  bool rating2Star = false;
  bool rating1Star = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              _buildHeader(),
              SizedBox(height: 24.h),
              // Filter content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sort By Section
                    _buildFilterSection(
                      title: 'Sort By:',
                      child: _buildDropdown(
                        value: selectedSortBy,
                        items: [
                          'My qualifications',
                          'Price',
                          'Rating',
                          'Distance',
                        ],
                        onChanged: (value) {
                          setState(() => selectedSortBy = value);
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Categories Section
                    _buildFilterSection(
                      title: 'Categories',
                      child: _buildDropdown(
                        value: selectedCategory,
                        items: [
                          'Cleaning Services',
                          'Plumbing',
                          'Electrical',
                          'Handyman',
                        ],
                        onChanged: (value) {
                          setState(() => selectedCategory = value);
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Sub Category Section
                    _buildFilterSection(
                      title: 'Sub Category',
                      child: _buildDropdown(
                        value: selectedSubCategory,
                        items: [
                          'Cleaning',
                          'Carpet Cleaning',
                          'Window Cleaning',
                          'Deep Cleaning',
                        ],
                        onChanged: (value) {
                          setState(() => selectedSubCategory = value);
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Location Section
                    _buildFilterSection(
                      title: 'Location',
                      child: _buildLocationField(),
                    ),
                    SizedBox(height: 24.h),

                    // By Rating Section
                    _buildRatingSection(),
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
                color: Colors.white,
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
            'Filter Search',
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

  Widget _buildFilterSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey[900],
          ),
        ),
        SizedBox(height: 8.h),
        child,
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: Colors.grey[800],
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildLocationField() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ZIP',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              ),
              style: GoogleFonts.poppins(fontSize: 14.sp),
              onChanged: (value) => setState(() => zipCode = value),
            ),
          ),
          Icon(
            Icons.location_on_outlined,
            color: Colors.grey[600],
            size: 20.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildRatingSection() {
    final ratings = [
      {
        'stars': 5,
        'count': 60,
        'value': rating5Star,
        'setter': (bool val) => setState(() => rating5Star = val),
      },
      {
        'stars': 4,
        'count': 50,
        'value': rating4Star,
        'setter': (bool val) => setState(() => rating4Star = val),
      },
      {
        'stars': 3,
        'count': 35,
        'value': rating3Star,
        'setter': (bool val) => setState(() => rating3Star = val),
      },
      {
        'stars': 2,
        'count': 8,
        'value': rating2Star,
        'setter': (bool val) => setState(() => rating2Star = val),
      },
      {
        'stars': 1,
        'count': 2,
        'value': rating1Star,
        'setter': (bool val) => setState(() => rating1Star = val),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'By Rating',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey[900],
          ),
        ),
        SizedBox(height: 12.h),
        ...ratings.map((rating) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _buildRatingCheckbox(
              stars: rating['stars'] as int,
              count: rating['count'] as int,
              value: rating['value'] as bool,
              onChanged: rating['setter'] as Function(bool),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildRatingCheckbox({
    required int stars,
    required int count,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 20.w,
          height: 20.w,
          child: Checkbox(
            value: value,
            onChanged: (newValue) => onChanged(newValue ?? false),
            side: BorderSide(color: Colors.grey[400]!, width: 1.5),
          ),
        ),
        SizedBox(width: 12.w),
        Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: Icon(
                Icons.star_rounded,
                color: index < stars
                    ? const Color(0xFFFF6B35)
                    : Colors.grey[300],
                size: 16.sp,
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          '($count)',
          style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
