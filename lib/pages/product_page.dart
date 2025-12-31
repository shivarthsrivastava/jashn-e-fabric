import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_footer.dart';
import '../models/product.dart';
import '../styles/app_styles.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  static final List<Product> availableProducts = [
    // ChatGPT Images (excluding first one)
    Product(
      id: 'P001',
      name: 'Branded Cord Set "BIBA"',
      price: '₹1,200.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 05_25_43 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P002',
      name: 'Branded Cord Set "BIBA"',
      price: '₹ 1,200.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 05_34_47 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P003',
      name: 'Branded Kurti "W"',
      price: '₹ 1,099.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 05_44_03 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P004',
      name: 'Branded 3 Pcs Suit Set "Jainiiz"',
      price: '₹ 2,199.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 06_20_19 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P005',
      name: 'Floral Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 06_24_27 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P006',
      name: 'Embroidery 3 Pcs Suit',
      price: '₹ 1,199.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 07_16_13 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P007',
      name: 'Silk Cord Set',
      price: '₹ 1,099.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 07_24_15 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P008',
      name: 'Branded Kurti "BIBA"',
      price: '₹ 1,199.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 08_26_22 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P009',
      name: 'Branded 3 Pcs Suit "Bhama Couture"',
      price: '₹ 2,499.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 08_37_23 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P010',
      name: 'Branded 3 Pcs Suit "LIBAS"',
      price: '₹ 1,999.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 08_49_36 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P011',
      name: 'Branded 3 Pcs Suit "LIBAS"',
      price: '₹ 2,199.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 09_14_57 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P012',
      name: 'Branded Kurti "W"',
      price: '₹ 1,099.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 09_26_42 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P013',
      name: 'Branded Kurti "BIBA"',
      price: '₹ 1,099.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 09_37_04 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P014',
      name: 'Branded 2 Pcs Suit "BIBA"',
      price: '₹ 1,499.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 09_50_17 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P015',
      name: 'Branded Kurti "BIBA"',
      price: '₹ 1199.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 14, 2025 at 10_17_39 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P016',
      name: 'Branded 2 Pcs Set "LIBAS"',
      price: '₹ 1,599.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 15, 2025 at 09_47_14 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P017',
      name: 'Branded Kurti "LIBAS"',
      price: '₹ 1,299.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 15, 2025 at 10_19_29 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P018',
      name: 'Branded Kurti "BIBA"',
      price: '₹ 1,099.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 15, 2025 at 10_23_29 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P019',
      name: 'Branded 3 Pcs Suit "LIBAS"',
      price: '₹ 2,399.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 16, 2025 at 08_46_46 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P020',
      name: 'Floral Design Cord Set',
      price: '₹ 799.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 16, 2025 at 09_16_41 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P021',
      name: '3 Pcs Suit with Embroidery',
      price: '₹ 1,399.00',
      imageUrl: 'assets/images/ChatGPT Image Sep 16, 2025 at 09_22_41 PM.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P022',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_1jffq41jffq41jff.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P023',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_2vvdl2vvdl2vvdl2.jpg',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P024',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_4dzcyu4dzcyu4dzc.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P025',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_844u6844u6844u68.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P026',
      name: 'Embroidery 3 Pcs Suit',
      price: '₹ 1,199.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_90vvm490vvm490vv.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P027',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_9czta59czta59czt.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P028',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_9wjfan9wjfan9wjf.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P029',
      name: '3 Pcs Suit with Embroidery',
      price: '₹ 1,599.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_buljclbuljclbulj.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P030',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_c1vww2c1vww2c1vw.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P031',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_ci14yvci14yvci14.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P032',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_cj3569cj3569cj35.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P033',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_elt36melt36melt3.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P034',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_fyugd3fyugd3fyug.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P035',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_gv2hlkgv2hlkgv2h.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P036',
      name: 'Pure Cotton 3 Pcs Suit Set',
      price: '₹ 1,199.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_gvad7wgvad7wgvad.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P037',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_i67mxyi67mxyi67m.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P038',
      name: '3 Pcs Suit with Embroidery',
      price: '₹ 1,399.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_ikr0kikr0kikr0ki.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P039',
      name: 'Floral Design Cord Set',
      price: '₹ 799.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_lax95tlax95tlax9.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P040',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_m7wj9am7wj9am7wj.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P041',
      name: 'Branded 3 Pcs Suit',
      price: '₹ 2,499.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_mczlkfmczlkfmczl.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P042',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_ng171tng171tng17.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P043',
      name: 'Branded Kurti "W"',
      price: '₹ 1,099.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_q0jr74q0jr74q0jr.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P044',
      name: 'Branded 3 Pcs Suit',
      price: '₹ 2,499.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_q8e264q8e264q8e2.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P045',
      name: 'Pure Cotton 3 Pcs Suit Set',
      price: '₹ 1,199.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_qj54epqj54epqj54.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P046',
      name: 'Embroidery 3 Pcs Suit',
      price: '₹ 1,199.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_rzbrwgrzbrwgrzbr.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P047',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_rzsovrrzsovrrzso.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P048',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_s216vss216vss216.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P049',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_sxhx8usxhx8usxhx.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P050',
      name: 'Embroidery 3 Pcs Suit',
      price: '₹ 1,199.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_tkq242tkq242tkq2.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P051',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_tr65sktr65sktr65.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P052',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_tu946htu946htu94.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P053',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_tzi794tzi794tzi7.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P054',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_ud9v7oud9v7oud9v.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P055',
      name: '3 Pcs Suit with Embroidery',
      price: '₹ 1,999.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_uygpdluygpdluygp.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P056',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_uzubevuzubevuzub.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P057',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_wfs3bawfs3bawfs3.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    Product(
      id: 'P058',
      name: 'Floral Design Cord Set',
      price: '₹ 300.00',
      imageUrl: 'assets/images/Gemini_Generated_Image_wnxz9lwnxz9lwnxz.png',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
    // WhatsApp Images
    Product(
      id: 'P059',
      name: '3 Pcs Suit with Embroidery',
      price: '₹ 1,499.00',
      imageUrl:
          'assets/images/WhatsApp Image 2025-08-24 at 11.18.51_cleanup.jpeg',
      whatsappLink: 'https://wa.me/c/918299743389',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'OUR COMPLETE CATALOGUE',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    // Silently handle image loading errors
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(child: Icon(Icons.error, size: 50)),
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: InkWell(
                  onTap: () => _launchURL(product.whatsappLink),
                  child: Container(
                    // ignore: deprecated_member_use
                    color: AppStyles.secondaryColor.withOpacity(0.1),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: AppStyles.primaryColor.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: AppStyles.secondaryColor.withOpacity(0.2),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Text(
                          'VIEW & ENQUIRE',
                          style: TextStyle(
                            color: AppStyles.secondaryColor,
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
            color: AppStyles.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
