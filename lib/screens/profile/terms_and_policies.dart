import 'package:flutter/material.dart';

class TermsAndPoliciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        title: Text('Terms and Policies'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our journey app. Please read this policy carefully to understand our practices regarding your personal data and how we will treat it.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Information We Collect',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We may collect certain personal information from you when you use our app, including but not limited to:\n\n- Contact information (such as name, email address, phone number)\n- Demographic information (such as age, gender, location)\n- Usage data (such as preferences, interactions with the app)\n\nWe collect this information to provide and improve our services, personalize your experience, and communicate with you.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'How We Use Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We may use the information we collect from you for various purposes, including:\n\n- To personalize your experience and deliver tailored content\n- To improve our app and develop new features\n- To communicate with you, including responding to your inquiries and providing updates\n- To comply with legal obligations and enforce our terms and policies\n\nWe do not sell or rent your personal information to third parties.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Data Security',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We implement reasonable security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. However, please note that no method of transmission over the internet or electronic storage is 100% secure.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Terms of Service',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'By using our journey app, you agree to comply with these Terms of Service. These terms govern your use of the app and include important provisions regarding your rights, responsibilities, and limitations of liability.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'User Responsibilities',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You are responsible for maintaining the confidentiality of your account and password, and for restricting access to your device. You agree to accept responsibility for all activities that occur under your account.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Prohibited Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'When using our app, you agree not to:\n\n- Violate any laws or regulations\n- Infringe upon the rights of others\n- Interfere with or disrupt the operation of the app\n- Use the app for any illegal or unauthorized purpose\n\nWe reserve the right to suspend or terminate your access to the app if you violate these terms.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Usage Guidelines',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'To ensure a positive experience for all users, please adhere to the following guidelines:\n\n- Respect other users and their privacy\n- Do not post or share inappropriate content\n- Report any issues or concerns promptly\n\nViolation of these guidelines may result in account suspension or termination without notice.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
