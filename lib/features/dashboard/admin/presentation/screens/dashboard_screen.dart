import 'package:flutter/material.dart';
import '../../../../auth/presentations/providers/auth_service_provider.dart';
import '../../../../auth/presentations/screens/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../category/presentation/admin/screens/category_list_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Text('Welcome to the Admin Dashboard')),
          ElevatedButton.icon(
            onPressed: () {
              authService.signOut();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CategoryListScreen();
                  },
                ),
              );
            },
            label: const Text('Category Management'),
            icon: const Icon(Icons.category),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              authService.signOut();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            label: const Text('Đăng xuất'),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
