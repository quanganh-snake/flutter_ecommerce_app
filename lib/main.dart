import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/auth/presentations/screens/login_screen.dart';
import 'package:flutter_ecommerce/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Dùng để đảm bảo rằng các binding của Flutter đã được khởi tạo trước khi chạy ứng dụng
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Khởi tạo Firebase trước khi chạy ứng dụng
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
