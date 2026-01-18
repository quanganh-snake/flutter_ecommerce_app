import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../../../../profile/presentation/user/screens/user_profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class AppMainScreen extends ConsumerStatefulWidget {
  const AppMainScreen({super.key});

  @override
  ConsumerState<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends ConsumerState<AppMainScreen> {
  int _selectedPageIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Trang chủ'),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal),
            label: 'Tìm kiếm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.notification),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle),
            label: 'Cá nhân',
          ),
        ],
      ),
    );
  }
}
