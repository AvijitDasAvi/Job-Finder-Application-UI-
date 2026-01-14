import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/core/widgets/custom_elevated_button.dart';
import 'package:kalmanprojects/features/jobs/controller/post_job_controller.dart';

class PostJobScreen extends StatelessWidget {
  const PostJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.isRegistered<PostJobController>()
        ? Get.find<PostJobController>()
        : Get.put(PostJobController());

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
                    // Category Section
                    _buildCategorySection(controller),
                    SizedBox(height: 24.h),
                    // Sub Category Section
                    _buildSubCategorySection(controller),
                    SizedBox(height: 24.h),
                    // Job Title Section
                    _buildJobTitleSection(controller),
                    SizedBox(height: 24.h),
                    // Description Section
                    _buildDescriptionSection(controller),
                    SizedBox(height: 24.h),
                    // Location Section
                    _buildLocationSection(controller),
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
            'Budget & Category',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Step 1 of 3 : Add the finishing touches',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 12.h),
          _buildSegmentedProgress(1),
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

  Widget _buildCategorySection(PostJobController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header with icon
        Row(
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: Color(0xFFFF7346),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Icon(
                  Icons.work_outline,
                  color: Color(0xFFFF7346),
                  size: 16.sp,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'Tell us about your project',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          'Provide details about what you need done',
          style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey[600]),
        ),
        SizedBox(height: 16.h),
        Text(
          'Category',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12.h),
        // Category grid
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 1.1,
          children: [
            _buildCategoryCard(
              icon: '🏠',
              title: 'Home Repairs',
              subtitle: 'Plumbing, electrical, carpentry, and more',
              isSelected: controller.selectedCategory.value == 'Home Repairs',
              onTap: () => controller.selectCategory('Home Repairs'),
            ),
            _buildCategoryCard(
              icon: '🧹',
              title: 'Cleaning Services',
              subtitle: 'House cleaning, window washing and more',
              isSelected:
                  controller.selectedCategory.value == 'Cleaning Services',
              onTap: () => controller.selectCategory('Cleaning Services'),
            ),
            _buildCategoryCard(
              icon: '🌱',
              title: 'Gardening',
              subtitle: 'Plant setup, garden maintenance, and more',
              isSelected: controller.selectedCategory.value == 'Gardening',
              onTap: () => controller.selectCategory('Gardening'),
            ),
            _buildCategoryCard(
              icon: '🛠️',
              title: 'Carpentry',
              subtitle: 'Furniture, cabinets, custom joinery, and more',
              isSelected: controller.selectedCategory.value == 'Carpentry',
              onTap: () => controller.selectCategory('Carpentry'),
            ),
            _buildCategoryCard(
              icon: '🎨',
              title: 'Udalosti',
              subtitle: 'Planunie Svadby, DJs, Stravoumenie a dalšie',
              isSelected: controller.selectedCategory.value == 'Udalosti',
              onTap: () => controller.selectCategory('Udalosti'),
            ),
            _buildCategoryCard(
              icon: '💡',
              title: 'Design & Tech',
              subtitle: 'Graphic Design, Web Design and more',
              isSelected: controller.selectedCategory.value == 'Design & Tech',
              onTap: () => controller.selectCategory('Design & Tech'),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => controller.onSeeAllCategories(),
            child: Text(
              'See all',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF7346),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard({
    required String icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFFE8E0) : Colors.grey[50],
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Color(0xFFFF7346) : Colors.grey[200]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(icon, style: TextStyle(fontSize: 28.sp)),
            SizedBox(height: 8.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    color: Colors.grey[600],
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubCategorySection(PostJobController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sub Category',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: [
            _buildSubCategoryTag('Plumbing', 'Plumbing', controller),
            _buildSubCategoryTag(
              'House cleaning',
              'House cleaning',
              controller,
            ),
            _buildSubCategoryTag(
              'window washing',
              'window washing',
              controller,
            ),
            _buildSubCategoryTag('cabinets', 'cabinets', controller),
            _buildSubCategoryTag('Cleaning', 'Cleaning', controller),
            _buildSubCategoryTag('Electrical', 'Electrical', controller),
          ],
        ),
        SizedBox(height: 12.h),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => controller.onSeeAllSubCategories(),
            child: Text(
              'See all',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF7346),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubCategoryTag(
    String label,
    String value,
    PostJobController controller,
  ) {
    final isSelected = controller.selectedSubCategories.contains(value);
    return GestureDetector(
      onTap: () => controller.toggleSubCategory(value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFF7346) : Colors.grey[100],
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: isSelected ? Color(0xFFFF7346) : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildJobTitleSection(PostJobController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job Title',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller.jobTitleController,
          decoration: InputDecoration(
            hintText: 'e.g. Fix leaky kitchen tap',
            hintStyle: GoogleFonts.poppins(
              fontSize: 13.sp,
              color: Colors.grey[400],
            ),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
          style: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection(PostJobController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller.descriptionController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText:
                'Describe what needs to be done, including any specific requirements, materials needed, or preferences you have...',
            hintStyle: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[400],
            ),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
          style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            'minimum 50/500 characters',
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              color: Colors.grey[500],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection(PostJobController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () => controller.onSelectLocation(),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey[400], size: 18.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: Obx(
                    () => Text(
                      controller.selectedLocation.value.isEmpty
                          ? 'Select Location'
                          : controller.selectedLocation.value,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        color: controller.selectedLocation.value.isEmpty
                            ? Colors.grey[400]
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                  size: 14.sp,
                ),
              ],
            ),
          ),
        ),
      ],
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
              'Cancel',
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
            text: 'Continue',
            onPressed: () => controller.onContinueTap(),
            backgroundColor: Color(0xFFFF7346),
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
