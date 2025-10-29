import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_footer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CONTACT US',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                "WE'RE HERE TO HELP",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            _buildContactInfoBlock(),
            const SizedBox(height: 50),
            _buildContactForm(),
            const SizedBox(height: 60),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoBlock() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          const Text(
            'GET IN TOUCH DIRECTLY',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 20),
          _buildContactTile(
            icon: Icons.chat_bubble_outline,
            title: 'WhatsApp Enquiries',
            subtitle: 'Instant support for all product details and orders.',
            actionText: 'Chat Now',
            onTap: () {
              _launchURL('https://wa.me/918299743389');
            },
          ),
          const Divider(height: 30),
          _buildContactTile(
            icon: Icons.shopping_bag_outlined,
            title: 'Browse Our Catalogue',
            subtitle: 'View our complete collection on WhatsApp',
            actionText: 'View Catalogue',
            onTap: () {
              _launchURL('https://wa.me/c/918299743389');
            },
          ),
          const Divider(height: 30),
          _buildContactTile(
            icon: Icons.location_on_outlined,
            title: 'Visit Our Store',
            subtitle: '149/269, Hari Nagar, Dugawan, Lucknow',
            actionText: 'Get Directions',
            onTap: () {
              _launchURL(
                'https://maps.google.com/?q=149/269,+Hari+Nagar,+Dugawan,+Lucknow',
              );
            },
          ),
          const Divider(height: 30),
          _buildContactTile(
            icon: Icons.phone_outlined,
            title: 'Call Us',
            subtitle: '+91 8299743389',
            actionText: 'Call Now',
            onTap: () {
              _launchURL('tel:+918299743389');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String actionText,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 14)),
      trailing: TextButton(
        onPressed: onTap,
        child: Text(
          actionText,
          style: const TextStyle(
            color: Color(0xFF8B0000),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SEND A MESSAGE',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const TextField(
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                debugPrint('Form Submitted (Functionality TBD)');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'SUBMIT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
