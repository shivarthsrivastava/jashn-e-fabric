import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_footer.dart';
import '../styles/app_styles.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // Silently handle errors to prevent console spam
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final String name = _nameController.text.trim();
      final String email = _emailController.text.trim();
      final String message = _messageController.text.trim();

      // Create mailto link with subject and body
      final String subject = Uri.encodeComponent(
        'Contact Form Submission from $name',
      );
      final String body = Uri.encodeComponent(
        'Name: $name\n'
        'Email: $email\n\n'
        'Message:\n$message',
      );

      final String mailtoLink =
          'mailto:jashnefabric@gmail.com?subject=$subject&body=$body';

      try {
        final Uri uri = Uri.parse(mailtoLink);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
          // Show success message
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Opening your email client to send the message...',
                ),
                duration: Duration(seconds: 3),
              ),
            );
          }
          // Clear form after successful submission
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Unable to open email client. Please send email manually to jashnefabric@gmail.com',
                ),
                duration: Duration(seconds: 4),
              ),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: $e'),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      leading: Icon(icon, size: 30, color: AppStyles.secondaryColor),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 14)),
      trailing: TextButton(
        onPressed: onTap,
        child: Text(
          actionText,
          style: TextStyle(
            color: AppStyles.secondaryColor,
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
        // ignore: deprecated_member_use
        color: AppStyles.primaryColor.withOpacity(0.3),
        // ignore: deprecated_member_use
        border: Border.all(color: AppStyles.secondaryColor.withOpacity(0.2)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SEND A MESSAGE',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@') || !value.contains('.')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a message';
                }
                return null;
              },
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyles.secondaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppStyles.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
