import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        title: Text('FAQ'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFAQSection(
              'Account Issues',
              [
                _buildFAQItem(
                  'How do I create an account?',
                  'You can create an account by tapping on the Sign Up button and filling out the required information.',
                ),
                _buildFAQItem(
                  'I forgot my password. What should I do?',
                  'You can reset your password by tapping on Forgot Password on the Sign In screen and following the instructions.',
                ),
              ],
            ),
            _buildFAQSection(
              'Booking and Reservations',
              [
                _buildFAQItem(
                  'How do I book a hotel or flight?',
                  'You can browse available options in the respective sections of our app and follow the booking process step-by-step.',
                ),
                _buildFAQItem(
                  'Can I cancel my booking?',
                  'Cancellation policies vary by provider. Please check the booking details for cancellation options and fees.',
                ),
              ],
            ),
            _buildFAQSection(
              'Payment Issues',
              [
                _buildFAQItem(
                  'Which payment methods do you accept?',
                  'We accept major credit cards and payment platforms such as PayPal for bookings.',
                ),
                _buildFAQItem(
                  'Why was my payment declined?',
                  'Payment declines may occur due to insufficient funds, incorrect card details, or security checks by your bank.',
                ),
              ],
            ),
            _buildFAQSection(
              'Travel Safety',
              [
                _buildFAQItem(
                  'How can I ensure my safety while traveling?',
                  'Always keep your belongings secure, follow local guidelines, and stay updated with travel advisories from authorities.',
                ),
                _buildFAQItem(
                  'What should I do in case of an emergency?',
                  'Contact local emergency services immediately and inform your embassy or consulate if necessary.',
                ),
              ],
            ),
            _buildFAQSection(
              'Technical Support',
              [
                _buildFAQItem(
                  'I am experiencing technical issues with the app. How can I get help?',
                  'Please contact our support team via email at support@example.com or through our app\'s Help section for assistance.',
                ),
                _buildFAQItem(
                  'The app crashes frequently on my device. What should I do?',
                  'Ensure that your app is updated to the latest version. If issues persist, contact support for further troubleshooting.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQSection(String title, List<Widget> faqItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ...faqItems,
        Divider(),
      ],
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(fontSize: 16),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            answer,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
