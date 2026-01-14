import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class JobsFilterScreen extends StatefulWidget {
  const JobsFilterScreen({super.key});

  @override
  State<JobsFilterScreen> createState() => _JobsFilterScreenState();
}

class _JobsFilterScreenState extends State<JobsFilterScreen> {
  String? selectedSortBy = 'My qualifications';
  String? selectedCategory = 'Cleaning Services';
  String? selectedSubCategory = 'Cleaning';
  String zipCode = '';
  RangeValues priceRange = const RangeValues(50.0, 500.0);

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

                    // Price Range Section
                    _buildPriceRangeSection(),
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

  Widget _buildPriceRangeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price Range',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey[900],
              ),
            ),
            Text(
              'Price : \$${priceRange.end.toStringAsFixed(2)}',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        // Price chart visualization
        Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                50,
                (index) => Container(
                  width: 2.5.w,
                  height: (20 + (index % 15) * 2).h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6B35),

                    borderRadius: BorderRadius.circular(1.r),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        // Range slider
        RangeSlider(
          values: priceRange,
          min: 0,
          max: 1000,
          divisions: 100,
          labels: RangeLabels(
            '\$${priceRange.start.toStringAsFixed(2)}',
            '\$${priceRange.end.toStringAsFixed(2)}',
          ),
          onChanged: (RangeValues values) {
            setState(() => priceRange = values);
          },
          activeColor: const Color(0xFFFF6B35),
          inactiveColor: Colors.grey[300],
        ),
        SizedBox(height: 8.h),
        // Min and Max labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                '\$${priceRange.start.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                '\$${priceRange.end.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
