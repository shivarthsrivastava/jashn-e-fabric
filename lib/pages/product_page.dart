import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_footer.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  // Mock Product Data
  static final List<Product> availableProducts = [
    Product(
      id: 'P001',
      name: 'Midnight Blue Kurta',
      price: '₹ 4,500',
      imageUrl: 'kurta_blue.jpg',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P002',
      name: 'Emerald Green Saree',
      price: '₹ 9,200',
      imageUrl: 'saree_green.jpg',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P003',
      name: 'Rose Gold Lehenga Set',
      price: '₹ 15,000',
      imageUrl: 'lehenga_rose.jpg',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P004',
      name: 'Hand-dyed Dupatta',
      price: '₹ 1,800',
      imageUrl: 'dupatta_dyed.jpg',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRODUCTS',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'OUR COMPLETE CATALOGUE',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: availableProducts.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 350,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final product = availableProducts[index];
                  return ProductGridCard(product: product);
                },
              ),
            ),
            const SizedBox(height: 50),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

class ProductGridCard extends StatelessWidget {
  final Product product;

  const ProductGridCard({required this.product, super.key});

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
                  onTap: () => _launchURL(product.whatsappLink),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5),
                          ],
                        ),
                        child: const Text(
                          'VIEW & ENQUIRE',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1.5,
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
          product.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          product.price,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
