import 'package:flutter/material.dart';
import 'package:kalmanprojects/core/common/constants/imagepath.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Imagepath.loginImageBack,
          height: 445,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Image.asset(
          Imagepath.loginImage,
          height: 421,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                'Enter your email and password to access your\naccount',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFF8F9FA),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 68),
            ],
          ),
        ),
      ],
    );
  }
}
