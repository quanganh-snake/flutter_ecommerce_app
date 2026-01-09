import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth
      .instance; // Khởi tạo FirebaseAuth dùng để xác thực người dùng
  final FirebaseFirestore _firestore = FirebaseFirestore
      .instance; // Khởi tạo Firestore để lưu trữ dữ liệu người dùng

  /// Đăng ký người dùng mới với email và mật khẩu
  Future<String?> signup({
    required String fullName,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Lưu thông tin người dùng vào Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullName': fullName.trim(),
        'email': email.trim(),
        'role': role,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return null; // Trả về null nếu đăng ký thành công
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'Email đã được sử dụng';
        case 'weak-password':
          return 'Mật khẩu quá yếu';
        default:
          return 'Đăng ký thất bại';
      }
    }
  }

  /// Funtion: Đăng nhập người dùng với email và mật khẩu
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      // Kiểm tra vai trò người dùng từ Firestore
      DocumentSnapshot<Map<String, dynamic>> userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      return userDoc['role'];
    } catch (e) {
      return e.toString();
    }
  }

  void signOut() {
    _firebaseAuth.signOut();
  }
}
