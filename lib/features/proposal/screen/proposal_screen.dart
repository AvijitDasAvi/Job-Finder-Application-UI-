import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/features/proposal/controller/proposal_controller.dart';
import 'package:kalmanprojects/features/proposal/widgets/proposal_card.dart';

class ProposalScreen extends StatelessWidget {
  const ProposalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final proposalController = Get.put(ProposalController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(proposalController),
              SizedBox(height: 20.h),
              _buildSearchAndFilterSection(proposalController),
              SizedBox(height: 20.h),
              _buildProposalsListSection(proposalController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ProposalController controller) {
    return Row(
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
          'Proposal',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 40.w),
      ],
    );
  }

  Widget _buildSearchAndFilterSection(ProposalController controller) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: TextField(
            onChanged: (value) => controller.onSearchChanged(value),
            decoration: InputDecoration(
              hintText: 'Search jobs...',
              hintStyle: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[600],
                size: 20.sp,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            style: GoogleFonts.poppins(fontSize: 14.sp),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!, width: 1.w),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Text(
                    'All Categories',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.expand_more, size: 16.sp, color: Colors.grey[600]),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProposalsListSection(ProposalController controller) {
    final proposals = [
      {
        'name': 'John Smith',
        'badge': 'Verified',
        'memberSince': 'Member since 2018',
        'rating': 5.0,
        'reviews': 20,
        'location': 'City, State, Zip',
        'jobTitle': 'Complete Kitchen Renovation',
        'description':
            'I will provide a complete kitchen renovation service including removal of existing units, installation of new cabinets, worktops, appliances, and all electrical work My approach includes proper...',
        'rate': '\$20.00/hr',
        'completed': 'Job complete (20)',
        'availability': 'Available tomorrow',
        'image': 'assets/images/01 Online Shopping 1.png',
        'accepted': false,
      },
      {
        'name': 'John Smith',
        'badge': 'Verified',
        'memberSince': 'Member since 2018',
        'rating': 5.0,
        'reviews': 20,
        'location': 'City, State, Zip',
        'jobTitle': 'Complete Kitchen Renovation',
        'description':
            'I will provide a complete kitchen renovation service including removal of existing units, installation of new cabinets, worktops, appliances, and all electrical work My approach includes proper...',
        'rate': '\$20.00/hr',
        'completed': 'Job complete (20)',
        'availability': 'Available tomorrow',
        'image': 'assets/images/01 Online Shopping 1.png',
        'accepted': true,
      },
      {
        'name': 'John Smith',
        'badge': 'Verified',
        'memberSince': 'Member since 2018',
        'rating': 5.0,
        'reviews': 20,
        'location': 'City, State, Zip',
        'jobTitle': 'Complete Kitchen Renovation',
        'description':
            'I will provide a complete kitchen renovation service including removal of existing units, installation of new cabinets, worktops, appliances, and all electrical work My approach includes proper...',
        'rate': '\$20.00/hr',
        'completed': 'Job complete (20)',
        'availability': 'Available tomorrow',
        'image': 'assets/images/01 Online Shopping 1.png',
        'accepted': false,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: proposals
          .map(
            (proposal) => ProposalCard(
              tradesmanName: proposal['name'] as String,
              badgeText: proposal['badge'] as String,
              memberSince: proposal['memberSince'] as String,
              rating: proposal['rating'] as double,
              reviewCount: proposal['reviews'] as int,
              location: proposal['location'] as String,
              jobTitle: proposal['jobTitle'] as String,
              description: proposal['description'] as String,
              hourlyRate: proposal['rate'] as String,
              jobsCompleted: proposal['completed'] as String,
              availability: proposal['availability'] as String,
              imagePath: proposal['image'] as String,
              isAccepted: proposal['accepted'] as bool,
              onAcceptTap: () => controller.onAcceptProposal(),
              onMessageTap: () => controller.onMessageTap(),
              onDeclineTap: () => controller.onDeclineProposal(),
            ),
          )
          .toList(),
    );
  }
}
