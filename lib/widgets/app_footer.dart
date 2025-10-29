import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

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
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.grey[100],
      child: Column(
        children: [
          const Text(
            'Connect with Jashn-e-Fabric',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(
                icon: Icons.message,
                url: 'https://wa.me/918299743389',
                color: const Color(0xFF25D366),
              ),
              _buildSocialIcon(
                icon: Icons.photo_camera,
                url: 'https://www.instagram.com/jashnefabric/',
                color: const Color(0xFFC13584),
              ),
              _buildSocialIcon(
                icon: Icons.facebook,
                url: 'https://www.facebook.com/profile.php?id=61579831120487',
                color: const Color(0xFF1877F2),
              ),
              _buildSocialIcon(
                icon: Icons.play_circle_outlined,
                url: 'https://www.youtube.com/@jashn-e-fabric',
                color: const Color(0xFFFF0000),
              ),
              const SizedBox(height: 20),
              Text(
                '149/269, Hari Nagar, Dugawan, Lucknow',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '+91 8299743389',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Divider(height: 30, thickness: 0.5),
          Text(
            '© ${DateTime.now().year} Jashn-e-Fabric. All rights reserved.',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required String url,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: IconButton(
        icon: Icon(icon, size: 30, color: color),
        onPressed: () => _launchURL(url),
      ),
    );
  }
}
