import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/auth/presentations/screens/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ecommerce/features/auth/presentations/providers/auth_service_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authServiceRef = ref.watch(authServiceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          const Center(child: Text('Welcome to the Home Screen!')),
          ElevatedButton(
            onPressed: () {
              authServiceRef.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
