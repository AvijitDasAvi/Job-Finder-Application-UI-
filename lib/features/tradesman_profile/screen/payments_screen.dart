import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalmanprojects/features/tradesman_profile/screen/payments_controller.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with Add New button
            _buildHeader(controller),
            SizedBox(height: 24.h),
            // Payment Methods section
            _buildPaymentMethodsSection(controller),
            SizedBox(height: 24.h),
            // Security info section
            _buildSecurityInfoSection(),
            SizedBox(height: 24.h),
            // Payment History section
            _buildPaymentHistorySection(controller),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(PaymentsController controller) {
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
            'Payments',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () => controller.onAddNewTap(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFF7346),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'Add New',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodsSection(PaymentsController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Methods',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          // First card - Current Default
          _buildPaymentCard(
            cardName: 'Visa ****4255',
            expiryDate: 'Expire date : 15/02/2024',
            isDefault: true,
            onSetDefault: () => controller.onSetAsDefaultTap('Visa ****4255'),
            onDelete: () => controller.onDeleteTap('Visa ****4255'),
          ),
          SizedBox(height: 12.h),
          // Second card - Can be set as default
          _buildPaymentCard(
            cardName: 'Visa ****4255',
            expiryDate: 'Expire date : 15/02/2024',
            isDefault: false,
            onSetDefault: () => controller.onSetAsDefaultTap('Visa ****4255'),
            onDelete: () => controller.onDeleteTap('Visa ****4255'),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard({
    required String cardName,
    required String expiryDate,
    required bool isDefault,
    required VoidCallback onSetDefault,
    required VoidCallback onDelete,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card header with icon and delete button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Card icon and details
              Row(
                children: [
                  // Card icon
                  Container(
                    width: 50.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFFF7346),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Icon(
                      Icons.credit_card,
                      color: const Color(0xFFFF7346),
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  // Card name and expiry
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardName,
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        expiryDate,
                        style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Delete button
              GestureDetector(
                onTap: onDelete,
                child: Icon(
                  Icons.delete_outline,
                  color: const Color(0xFFFF7346),
                  size: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Default or Set as Default button
          if (isDefault)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                'Current Default',
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            )
          else
            GestureDetector(
              onTap: onSetDefault,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7346),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  'Set as Default',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSecurityInfoSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3E0),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: const Color(0xFFFFB74D), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with shield icon
            Row(
              children: [
                Icon(
                  Icons.security,
                  color: const Color(0xFFFF7346),
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Your payments are secure',
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFF7346),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // Security info bullets
            _buildSecurityBullet(
              'All payments are processed securely through our trusted payment partners',
            ),
            SizedBox(height: 8.h),
            _buildSecurityBullet(
              'We never store your full payment information on our servers',
            ),
            SizedBox(height: 8.h),
            _buildSecurityBullet(
              'All transactions are encrypted and PCI compliant',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityBullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey[700]),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentHistorySection(PaymentsController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment History',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          // Transaction 1
          _buildTransactionCard(
            title: 'Kitchen Cabinet Installation',
            status: 'Shortlisted',
            statusColor: const Color(0xFF4CAF50),
            date: '15/02/2024',
            cardUsed: 'Visa ****4255',
            downloadStatement: () =>
                controller.onDownloadStatement('Kitchen Cabinet Installation'),
            amount: '-\$10.00',
          ),
          SizedBox(height: 12.h),
          // Transaction 2
          _buildTransactionCard(
            title: 'Wedding Photography',
            status: 'Shortlisted',
            statusColor: const Color(0xFF4CAF50),
            date: '15/02/2024',
            cardUsed: 'Visa ****4255',
            downloadStatement: () =>
                controller.onDownloadStatement('Wedding Photography'),
            amount: '-\$10.00',
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionCard({
    required String title,
    required String status,
    required Color statusColor,
    required String date,
    required String cardUsed,
    required VoidCallback downloadStatement,
    required String amount,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with status badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Date and card details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date : $date',
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    cardUsed,
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Text(
                amount,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFF7346),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Download statement button
          GestureDetector(
            onTap: downloadStatement,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Download statement',
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Icon(Icons.download, color: Colors.white, size: 12.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
