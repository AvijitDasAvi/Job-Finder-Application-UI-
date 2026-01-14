import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SendInvitationScreen extends StatefulWidget {
  const SendInvitationScreen({super.key});

  @override
  State<SendInvitationScreen> createState() => _SendInvitationScreenState();
}

class _SendInvitationScreenState extends State<SendInvitationScreen> {
  String? selectedJob;
  final TextEditingController messageController = TextEditingController();

  final List<String> jobList = [
    'Select your job/project',
    'Bathroom Renovation',
    'Kitchen Remodeling',
    'House Painting',
    'Garden Landscaping',
    'General Maintenance',
  ];

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
              // Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'Book this Tradesperson',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Select Jobs Section
                    _buildSectionTitle('Select jobs'),
                    SizedBox(height: 12.h),
                    _buildJobsDropdown(),
                    SizedBox(height: 24.h),

                    // Send Special Message Section
                    _buildSectionTitle('Send Special Message (Optional)'),
                    SizedBox(height: 12.h),
                    _buildMessageField(),
                    SizedBox(height: 32.h),

                    // Buttons
                    _buildButtonsRow(),
                    SizedBox(height: 24.h),
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
            'Send Invitation',
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey[900],
      ),
    );
  }

  Widget _buildJobsDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      child: DropdownButton<String>(
        value: selectedJob,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        hint: Text(
          'Select your job/project',
          style: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.grey[600]),
        ),
        items: jobList.map((String job) {
          return DropdownMenuItem<String>(
            value: job == 'Select your job/project' ? null : job,
            child: Text(
              job,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                color: Colors.grey[800],
              ),
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() => selectedJob = value);
        },
        icon: Icon(Icons.arrow_drop_down, color: Colors.grey[600], size: 20.sp),
      ),
    );
  }

  Widget _buildMessageField() {
    return TextField(
      controller: messageController,
      maxLines: 6,
      decoration: InputDecoration(
        hintText: 'Any specific requirements or additional information...',
        hintStyle: GoogleFonts.poppins(
          fontSize: 13.sp,
          color: Colors.grey[600],
        ),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
        ),
        contentPadding: EdgeInsets.all(12.w),
      ),
      style: GoogleFonts.poppins(fontSize: 13.sp),
    );
  }

  Widget _buildButtonsRow() {
    return Row(
      children: [
        // Cancel Button
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: OutlinedButton(
              onPressed: () => Get.back(),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey[600]!, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        // Send Invitation Button
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: ElevatedButton(
              onPressed: () {
                // Handle send invitation
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Send Invitation',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
