import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/core/widgets/custom_elevated_button.dart';
import 'package:kalmanprojects/features/jobs/screen/job_details_screen.dart';

class JobCard extends StatelessWidget {
  final String jobTitle;
  final String description;
  final String clientName;
  final String distance;
  final String date;
  final String timeframe;
  final int applicantsCount;
  final VoidCallback onSendProposal;

  const JobCard({
    super.key,
    required this.jobTitle,
    required this.description,
    required this.clientName,
    required this.distance,
    required this.date,
    required this.timeframe,
    required this.applicantsCount,
    required this.onSendProposal,
  });

  String _getProfileImage(String clientName) {
    final name = clientName.toLowerCase();
    if (name.contains('john')) {
      return 'assets/images/john.png';
    } else if (name.contains('jane')) {
      return 'assets/images/jane.png';
    } else if (name.contains('kathryn')) {
      return 'assets/images/kathryn.png';
    }
    return 'assets/images/Rectangle 7233.png';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const JobDetailsScreen()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[200]!, width: 1.w),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job title
            Text(
              jobTitle,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8.h),
            // Description
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: Colors.grey[800],
                height: 1.5,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.h),
            Divider(),
            SizedBox(height: 10.h),
            // Client info row
            Row(
              children: [
                Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[300]!, width: 1),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      _getProfileImage(clientName),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.person,
                            color: Colors.grey[600],
                            size: 20.sp,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  clientName,
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            // SizedBox(height: 8.h),
            // Details row
            Row(
              children: [
                Icon(Icons.location_on, size: 12.sp, color: Colors.grey[600]),
                SizedBox(width: 2.w),
                Text(
                  distance,
                  style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(width: 12.w),
                Icon(
                  Icons.calendar_today,
                  size: 12.sp,
                  color: Colors.grey[600],
                ),
                SizedBox(width: 2.w),
                Text(
                  date,
                  style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(width: 12.w),
                Icon(Icons.access_time, size: 12.sp, color: Colors.grey[600]),
                SizedBox(width: 2.w),
                Text(
                  timeframe,
                  style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Divider(),
            SizedBox(height: 10.h),
            // Applicants count
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Applicants: ',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: applicantsCount.toString().padLeft(2, '0'),
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFE74C3C),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            // Send Proposal button
            CustomElevatedButton(
              text: 'Send Proposal',
              onPressed: onSendProposal,
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
}
