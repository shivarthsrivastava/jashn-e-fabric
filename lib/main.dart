import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'pages/home_page.dart';
import 'pages/product_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'styles/app_styles.dart';
import 'widgets/modern_nav_bar.dart';
import 'widgets/app_drawer.dart';

void main() {
  runApp(const JashnEFabricApp());
}

class JashnEFabricApp extends StatelessWidget {
  const JashnEFabricApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jashn-e-Fabric',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      theme: ThemeData(
        colorScheme: AppStyles.colorScheme,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: AppStyles.headingSmall,
        ),
        textTheme: TextTheme(
          displayLarge: AppStyles.headingLarge,
          displayMedium: AppStyles.headingMedium,
          displaySmall: AppStyles.headingSmall,
          bodyLarge: AppStyles.bodyLarge,
          bodyMedium: AppStyles.bodyMedium,
          bodySmall: AppStyles.bodySmall,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: AppStyles.primaryButton,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: AppStyles.outlinedButton,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainNavigator(),
    );
  }
}

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ProductPage(),
    AboutPage(),
    ContactPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ModernNavBar(
        onMenuTap: () {
          Scaffold.of(context).openDrawer();
        },
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
      drawer: AppDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
