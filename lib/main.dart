import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/auth/presentations/screens/login_screen.dart';
import 'package:flutter_ecommerce/features/admin/dashboard/presentations/screens/dashboard_screen.dart';
import 'package:flutter_ecommerce/features/user/home/presentations/screens/home_screen.dart';
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
      home: AuthStatusHandler(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Widget để xử lý & giữ trạng thái xác thực và điều hướng người dùng dựa trên vai trò của họ
// Sử dụng StatefulWidget để quản lý trạng thái người dùng và vai trò
// Khi hot restarting, trạng thái xác thực sẽ được giữ nguyên không bị navigate lại
class AuthStatusHandler extends StatefulWidget {
  const AuthStatusHandler({super.key});

  @override
  State<AuthStatusHandler> createState() => _AuthStatusHandlerState();
}

class _AuthStatusHandlerState extends State<AuthStatusHandler> {
  User? _currentUser;
  String? _userRole;

  @override
  void initState() {
    _initializeAuthState();
    super.initState();
  }

  void _initializeAuthState() {
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (!mounted)
        return; // Ngăn chặn việc cập nhật trạng thái nếu widget đã bị hủy (disposed)
      setState(() {
        _currentUser = user;
      });

      if (user != null) {
        // Giả sử có một hàm fetchUserRole để lấy vai trò người dùng từ cơ sở dữ liệu
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (!mounted) return;
        if (userDoc.exists) {
          setState(() {
            _userRole = userDoc.data()?['role'] as String?;
          });
        }
      } else {
        setState(() {
          _userRole = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser == null) {
      return const LoginScreen();
    }

    if (_userRole == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return _userRole == 'admin' ? const DashboardScreen() : const HomeScreen();
  }
}
