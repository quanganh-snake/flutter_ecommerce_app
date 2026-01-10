import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/auth/presentations/providers/auth_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          Center(child: Text('Welcome to the Admin Dashboard')),
          ElevatedButton.icon(
            onPressed: () {
              authService.signOut();
            },
            label: Text('Đăng xuất'),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
