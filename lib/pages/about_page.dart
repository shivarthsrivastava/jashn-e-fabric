import 'package:flutter/material.dart';
import '../widgets/app_footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ABOUT JASHN-E-FABRIC',
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
            _buildAboutHero(),
            const SizedBox(height: 50),
            _buildBrandStory(),
            const SizedBox(height: 50),
            _buildImageDivider(),
            const SizedBox(height: 50),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutHero() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          const Text(
            'CELEBRATING THREADS, TRADITION, AND TRANSFORMATION.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 15),
          Container(width: 80, height: 3, color: Colors.black),
        ],
      ),
    );
  }

  Widget _buildBrandStory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'OUR JOURNEY',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Jashn-e-Fabric was founded on the principle that clothing is not just an outfit, but a celebration. From the intricate weave of a handloom to the vibrant dye of traditional patterns, every piece tells a story of heritage and craftsmanship. We partner directly with artisan communities to bring you fabrics that are ethically sourced and truly unique.',
            style: TextStyle(fontSize: 16, height: 1.6),
          ),
          const SizedBox(height: 30),
          _buildValuePoint('Authentic Craftsmanship', Icons.star_border),
          _buildValuePoint('Sustainable Sourcing', Icons.eco_outlined),
          _buildValuePoint('Timeless Design', Icons.diamond_outlined),
        ],
      ),
    );
  }

  Widget _buildValuePoint(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF8B0000)),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildImageDivider() {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.grey[200]),
    );
  }
}
