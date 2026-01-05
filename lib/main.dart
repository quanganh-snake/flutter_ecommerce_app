import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Dùng để đảm bảo rằng các binding của Flutter đã được khởi tạo trước khi chạy ứng dụng
  // await Firebase.initializeApp(); // Khởi tạo Firebase trước khi chạy ứng dụng
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(body: Center(child: Text('Hello, World!'))),
      debugShowCheckedModeBanner: false,
    );
  }
}
