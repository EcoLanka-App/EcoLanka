import 'package:flutter/material.dart';

class OTPVerificationScreen extends StatelessWidget {
  final String phoneNumber;

  const OTPVerificationScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Verification')),
      body: Center(
        child: Text('Code sent to $phoneNumber'),
      ),
    );
  }
}