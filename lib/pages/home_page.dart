import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_footer.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:animations/animations.dart';
import 'package:spring/spring.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _previousPage = 0;
  Timer? _timer;
  final springController = SpringController();
  final SpringController _springController = SpringController();

  get item => null;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildCarouselPage(Map<String, String> item, double screenWidth) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Image with shimmer loading effect
        CachedNetworkImage(
          imageUrl: item['image']!,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 500),
          fadeOutDuration: const Duration(milliseconds: 500),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            period: const Duration(milliseconds: 1500),
            child: Container(color: Colors.white),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 50, color: Colors.grey[400]),
                const SizedBox(height: 8),
                Text(
                  'Image not available',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
        // Gradient overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // ignore: deprecated_member_use
                Colors.black.withOpacity(0.4),
                // ignore: deprecated_member_use
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
        ),
        // Content with spring animation
        Spring.fadeIn(
          springController: _springController,
          delay: const Duration(milliseconds: 200),
          animDuration: const Duration(milliseconds: 800),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spring.slide(
                  slideType: SlideType.slide_in_top,
                  delay: const Duration(milliseconds: 300),
                  animDuration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutQuint,
                  extend: 30,
                  child: Text(
                    item['title']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: screenWidth > 600 ? 50.0 : 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Spring.slide(
                  slideType: SlideType.slide_in_bottom,
                  delay: const Duration(milliseconds: 400),
                  animDuration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutQuint,
                  extend: 30,
                  child: Text(
                    item['subtitle']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: screenWidth > 600 ? 24.0 : 18.0,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                OutlinedButton(
                  onPressed: () => _launchURL('https://wa.me/c/918299743389'),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 2),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: screenWidth > 600 ? 20.0 : 15.0,
                    ),
                  ),
                  child: const Text(
                    'SHOP NOW',
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
        ),
      ],
    );
  }

  Widget _buildDotIndicators(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Spring.scale(
          delay: Duration(milliseconds: 100 * index),
          animDuration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuint,
          start: 0.6,
          end: 1.0,
          child: Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(
                _currentPage == index ? 0.9 : 0.4,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

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
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroBanner(screenWidth),
            const SizedBox(height: 50),
            _buildProductGrid(),
            const SizedBox(height: 50),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroBanner(double screenWidth) {
    final List<Map<String, String>> bannerItems = [
      {
        'image':
            'https://source.unsplash.com/1600x900/?indian,embroidery,purple',
        'title': 'ELEGANT EMBROIDERY',
        'subtitle': 'Discover our premium collection of hand-crafted designs',
      },
      {
        'image':
            'https://source.unsplash.com/1600x900/?traditional,white,indian',
        'title': 'TRADITIONAL CHARM',
        'subtitle': 'Timeless pieces that tell a story',
      },
      {
        'image': 'https://source.unsplash.com/1600x900/?indian,fashion,yellow',
        'title': 'SPRING COLLECTION',
        'subtitle': 'Vibrant colors meet elegant designs',
      },
    ];

    // Prefetch next image
    if (_currentPage < bannerItems.length - 1) {
      precacheImage(
        CachedNetworkImageProvider(bannerItems[_currentPage + 1]['image']!),
        context,
      );
    }

    return Container(
      height: screenWidth * 0.75,
      child: Stack(
        children: [
          PageTransitionSwitcher(
            duration: const Duration(milliseconds: 800),
            reverse: _currentPage < _previousPage,
            transitionBuilder: (child, animation, secondaryAnimation) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
            child: _buildCarouselPage(bannerItems[_currentPage], screenWidth),
          ),
          // Dot indicators with spring animation
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Spring.slide(
              slideType: SlideType.slide_in_bottom,
              delay: const Duration(milliseconds: 300),
              animDuration: const Duration(milliseconds: 800),
              curve: Curves.easeOutQuint,
              extend: 30,
              withFade: true,
              child: _buildDotIndicators(bannerItems.length),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    const String catalogueLink = 'https://wa.me/c/918299743389';
    final List<Map<String, String>> products = [
      {
        'title': 'Festive Kurta Set',
        'image': 'https://source.unsplash.com/800x1000/?indian,kurta',
        'link': catalogueLink,
      },
      {
        'title': 'Handloom Saree',
        'image': 'https://source.unsplash.com/800x1000/?saree,traditional',
        'link': catalogueLink,
      },
      {
        'title': 'Embroidered Dupatta',
        'image': 'https://source.unsplash.com/800x1000/?dupatta,scarf',
        'link': catalogueLink,
      },
      {
        'title': 'Silk Trousers',
        'image': 'https://source.unsplash.com/800x1000/?palazzo,pants',
        'link': catalogueLink,
      },
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
              return _ProductCard(
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

class _ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String whatsappLink;

  const _ProductCard({
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
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(color: Colors.white),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.error),
                  ),
                ),
              ),
              Positioned.fill(
                child: InkWell(
                  onTap: () => _launchURL(whatsappLink),
                  child: Container(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.1),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
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
