import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JASHN-E-FABRIC',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildValoreHeroBanner(screenWidth),
            const SizedBox(height: 50),
            _buildValoreProductGrid(),
            const SizedBox(height: 50),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildValoreHeroBanner(double screenWidth) {
    final headlineSize = screenWidth > 600 ? 50.0 : 32.0;
    final buttonPadding = screenWidth > 600 ? 20.0 : 15.0;

    return Container(
      height: screenWidth * 0.75,
      decoration: const BoxDecoration(color: Colors.black),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'JASHN-E-FABRIC',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: headlineSize * 0.5,
                color: Colors.white70,
                letterSpacing: 4,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'THE NEW SILHOUETTE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: headlineSize,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {
                _launchURL('https://wa.me/c/918299743389');
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 2),
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: buttonPadding,
                ),
              ),
              child: const Text(
                'SHOP NEW COLLECTION',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValoreProductGrid() {
    final String catalogueLink = 'https://wa.me/c/918299743389';
    final List<Map<String, String>> products = [
      {
        'title': 'Festive Kurta Set',
        'image': 'item1.jpg',
        'link': catalogueLink,
      },
      {'title': 'Handloom Saree', 'image': 'item2.jpg', 'link': catalogueLink},
      {
        'title': 'Embroidered Dupatta',
        'image': 'item3.jpg',
        'link': catalogueLink,
      },
      {'title': 'Silk Trousers', 'image': 'item4.jpg', 'link': catalogueLink},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'LATEST ARRIVALS',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          Container(width: 50, height: 3, color: Colors.black),
          const SizedBox(height: 30),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350,
              childAspectRatio: 0.7,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return _ValoreProductCard(
                title: product['title']!,
                imageUrl: product['image']!,
                whatsappLink: product['link']!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ValoreProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String whatsappLink;

  const _ValoreProductCard({
    required this.title,
    required this.imageUrl,
    required this.whatsappLink,
  });

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(decoration: BoxDecoration(color: Colors.grey[200])),
              Positioned.fill(
                child: InkWell(
                  onTap: () => _launchURL(whatsappLink),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: const Text(
                          'VIEW ON WHATSAPP',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const Text(
          'Shop Now',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
