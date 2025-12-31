import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../styles/app_styles.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppStyles.secondaryColor),
      child: Column(
        children: [
          // Main Footer Content
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24.0 : 60.0,
              vertical: 50.0,
            ),
            child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
          ),

          // Bottom Bar
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24.0 : 60.0,
              vertical: 20.0,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  // ignore: deprecated_member_use
                  color: AppStyles.primaryColor.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© ${DateTime.now().year} Jashn-e-Fabric',
                  style: TextStyle(
                    fontSize: 12,
                    // ignore: deprecated_member_use
                    color: AppStyles.primaryColor.withOpacity(0.8),
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  'All rights reserved',
                  style: TextStyle(
                    fontSize: 12,
                    // ignore: deprecated_member_use
                    color: AppStyles.primaryColor.withOpacity(0.8),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand Section
        _buildBrandSection(),
        const SizedBox(height: 40),

        // Quick Links
        _buildQuickLinks(),
        const SizedBox(height: 40),

        // Contact Section
        _buildContactSection(),
        const SizedBox(height: 40),

        // Social Media
        _buildSocialSection(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Brand Section
        Expanded(flex: 2, child: _buildBrandSection()),
        const SizedBox(width: 40),

        // Quick Links
        Expanded(flex: 1, child: _buildQuickLinks()),
        const SizedBox(width: 40),

        // Contact Section
        Expanded(flex: 2, child: _buildContactSection()),
        const SizedBox(width: 40),

        // Social Media
        Expanded(flex: 1, child: _buildSocialSection()),
      ],
    );
  }

  Widget _buildBrandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'JASHN-E-FABRIC',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppStyles.primaryColor,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Unfold The Fabric of Fashion',
          style: TextStyle(
            fontSize: 14,
            // ignore: deprecated_member_use
            color: AppStyles.primaryColor.withOpacity(0.8),
            letterSpacing: 0.5,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Celebrating traditional craftsmanship with modern elegance. Every piece tells a story of heritage and artistry.',
          style: TextStyle(
            fontSize: 13,
            // ignore: deprecated_member_use
            color: AppStyles.primaryColor.withOpacity(0.7),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUICK LINKS',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppStyles.primaryColor,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 20),
        _buildLinkItem('Home', () {}),
        const SizedBox(height: 12),
        _buildLinkItem('Products', () {}),
        const SizedBox(height: 12),
        _buildLinkItem('About', () {}),
        const SizedBox(height: 12),
        _buildLinkItem('Contact', () {}),
      ],
    );
  }

  Widget _buildLinkItem(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          // ignore: deprecated_member_use
          color: AppStyles.primaryColor.withOpacity(0.8),
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CONTACT US',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppStyles.primaryColor,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 20),
        _buildContactInfo(
          icon: Icons.location_on_outlined,
          text: '149/269, Hari Nagar, Dugawan, Lucknow',
        ),
        const SizedBox(height: 16),
        _buildContactInfo(icon: Icons.phone_outlined, text: '+91 8299743389'),
        const SizedBox(height: 16),
        _buildContactInfo(
          icon: Icons.mail_lock_outlined,
          text: 'jashnefabric@gmail.com',
        ),
      ],
    );
  }

  Widget _buildContactInfo({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppStyles.primaryColor),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              // ignore: deprecated_member_use
              color: AppStyles.primaryColor.withOpacity(0.8),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FOLLOW US',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppStyles.primaryColor,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildSocialIcon(
              icon: Icons.message,
              url: 'https://wa.me/918299743389',
              color: const Color(0xFF25D366),
              label: 'WhatsApp',
            ),
            const SizedBox(width: 12),
            _buildSocialIcon(
              icon: Icons.photo_camera,
              url: 'https://www.instagram.com/jashnefabric/',
              color: const Color(0xFFC13584),
              label: 'Instagram',
            ),
            const SizedBox(width: 12),
            _buildSocialIcon(
              icon: Icons.facebook,
              url: 'https://www.facebook.com/profile.php?id=61579831120487',
              color: const Color(0xFF1877F2),
              label: 'Facebook',
            ),
            const SizedBox(width: 12),
            _buildSocialIcon(
              icon: Icons.play_circle_outlined,
              url: 'https://www.youtube.com/@jashn-e-fabric',
              color: const Color(0xFFFF0000),
              label: 'YouTube',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required String url,
    required Color color,
    required String label,
  }) {
    return Tooltip(
      message: label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _launchURL(url),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: AppStyles.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                // ignore: deprecated_member_use
                color: AppStyles.primaryColor.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
        ),
      ),
    );
  }
}
