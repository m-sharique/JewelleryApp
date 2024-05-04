import 'package:flutter/material.dart';
import '../widgets/collection_page_widget.dart';
import '../widgets/home_page_widget.dart';
import '../widgets/profile_page_widget.dart';
import '../widgets/search_page_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget> [
    HomePageWidget(),
    SearchPageWidget(),
    CollectionPageWidget(),
    ProfilePageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50), // Set your desired height
        child: Container( // This container should have the rounded border
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.zero),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: AppBar( // This is the standard AppBar widget
            elevation: 0,
            shadowColor: const Color.fromRGBO(150, 150, 150, 0.5),
            centerTitle: true,
            backgroundColor: Colors.transparent, // Transparent background
            title: const Text('JewelryApp'),
          ),
        ),
      ),
      body:  _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              blurRadius: 100,
              color: Color.fromRGBO(150, 150, 150, 0.5),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromRGBO(255, 255, 255, 0.5),
              tabs: const [
                GButton(icon: Icons.home_filled, text: "Home"),
                GButton(icon: Icons.camera_alt_rounded, text: "Search"),
                GButton(icon: Icons.collections_bookmark_rounded, text: "Box"),
                GButton(icon: Icons.person, text: "Profile"),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
