import 'package:flutter/material.dart';
import '../../domain/validators/email.dart';
import '../../domain/validators/password.dart';
import '../providers/login_form_provider.dart';
import '../providers/login_form_state.dart';
import 'signup_screen.dart';
import '../../../dashboard/admin/presentation/screens/dashboard_screen.dart';
import '../../../dashboard/user/presentation/screens/app_main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(loginFormProvider);
    final notifier = ref.read(loginFormProvider.notifier);

    ref.listen<LoginFormState>(loginFormProvider, (previous, next) {
      final role = next.role;
      if (previous?.isSubmitting == true && !next.isSubmitting) {
        if (next.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          if (role == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Tài khoản chưa được kích hoạt! Vui lòng kiểm tra email.',
                ),
                backgroundColor: Colors.red,
              ),
            );
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                role == 'user'
                    ? 'Bạn đã đăng nhập với email người dùng ${next.email.value} thành công!'
                    : role == 'admin'
                    ? 'Bạn đã đăng nhập với email quản trị viên ${next.email.value} thành công!'
                    : 'Đăng nhập thành công!',
              ),
              backgroundColor: Colors.green,
            ),
          );
          if (role == 'admin') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          } else if (role == 'user') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const AppMainScreen()),
            );
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const AppMainScreen()),
            );
          }
        }
      }
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 253, 249),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_market.png',
                    height: 220,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Email',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 4),
              TextField(
                onChanged: notifier.onEmailChanged,
                decoration: InputDecoration(
                  errorText: form.email.error == EmailValidationError.empty
                      ? 'Vui lòng nhập email'
                      : form.email.error == EmailValidationError.invalid
                      ? 'Email không đúng định dạng!'
                      : null,
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 2,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 1,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusColor: Colors.orange,
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                cursorColor: Colors.orange,
              ),
              const SizedBox(height: 16),
              const Text(
                'Mật khẩu',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 4),
              TextFormField(
                obscureText: !form.isShowPassword,
                onChanged: notifier.onPasswordChanged,
                decoration: InputDecoration(
                  errorText:
                      form.password.error == PasswordValidationError.empty
                      ? 'Vui lòng nhập mật khẩu'
                      : form.password.error == PasswordValidationError.tooShort
                      ? 'Tối thiểu 6 ký tự'
                      : null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 1,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusColor: Colors.orange,
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      form.isShowPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: notifier.togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: form.isValid && !form.isSubmitting
                      ? notifier.submit
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.orange,
                  ),
                  child: form.isSubmitting
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 1.5,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Đang đăng nhập...',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Bạn chưa có tài khoản?"),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      );
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 1),
                      child: Text(
                        'Đăng ký ngay',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
