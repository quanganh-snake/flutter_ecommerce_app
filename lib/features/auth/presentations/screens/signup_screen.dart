import 'package:flutter/material.dart';
import '../../domain/validators/confirmpassword.dart';
import '../../domain/validators/email.dart';
import '../../domain/validators/password.dart';
import '../providers/signup_form_provider.dart';
import 'login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupForm = ref.watch(signupNotifierProvider);
    final isLoading = signupForm.isSubmitting;

    ref.listen(signupNotifierProvider, (previous, next) {
      if (next.submitError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.submitError!),
            backgroundColor: Colors.red,
          ),
        );
      }

      if (next.isSuccess) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Đăng ký thành công')));
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Image.asset(
                'assets/images/login-concept-illustration.png',
                height: 220,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),

              TextField(
                onChanged: (value) => ref
                    .read(signupNotifierProvider.notifier)
                    .onFullNameChanged(value),
                decoration: InputDecoration(
                  labelText: 'Họ và tên',
                  errorText: signupForm.fullName.error,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                onChanged: (value) => ref
                    .read(signupNotifierProvider.notifier)
                    .onEmailChanged(value),
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText:
                      signupForm.email.error == EmailValidationError.empty
                      ? 'Vui lòng nhập email'
                      : signupForm.email.error == EmailValidationError.invalid
                      ? 'Email không đúng định dạng!'
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: !signupForm.isShowPassword,
                onChanged: (value) => ref
                    .read(signupNotifierProvider.notifier)
                    .onPasswordChanged(value),
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  errorText:
                      signupForm.password.error == PasswordValidationError.empty
                      ? 'Vui lòng nhập mật khẩu'
                      : signupForm.password.error ==
                            PasswordValidationError.tooShort
                      ? 'Mật khẩu quá ngắn!'
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      signupForm.isShowPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      ref
                          .read(signupNotifierProvider.notifier)
                          .togglePasswordVisibility();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: !signupForm.isShowConfirmPassword,
                maxLength: 100,
                onChanged: (value) => ref
                    .read(signupNotifierProvider.notifier)
                    .onConfirmPasswordChanged(value),
                decoration: InputDecoration(
                  labelText: 'Xác nhận mật khẩu',
                  counterText: '',
                  errorText:
                      signupForm.confirmPassword.error ==
                          ConfirmPasswordValidationError.empty
                      ? 'Vui lòng xác nhận mật khẩu'
                      : signupForm.confirmPassword.error ==
                            ConfirmPasswordValidationError.notMatch
                      ? 'Mật khẩu không khớp!'
                      : null,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      signupForm.isShowConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      ref
                          .read(signupNotifierProvider.notifier)
                          .toggleConfirmPasswordVisibility();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(value: 'user', child: Text('User')),
                  DropdownMenuItem(value: 'admin', child: Text('Admin')),
                ],
                initialValue: signupForm.role.value.isNotEmpty
                    ? signupForm.role.value
                    : 'user',
                onChanged: (value) {
                  ref
                      .read(signupNotifierProvider.notifier)
                      .onRoleChanged(value!);
                },
                decoration: InputDecoration(
                  labelText: 'Chọn vai trò',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: signupForm.isSubmitting
                      ? null
                      : () async {
                          await ref
                              .read(signupNotifierProvider.notifier)
                              .submit();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  label: const Text(
                    'Đăng ký',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  icon: Icon(
                    isLoading ? Icons.hourglass_top : Icons.person_add,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Bạn đã có tài khoản?"),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    splashColor: const Color.fromARGB(102, 182, 234, 240),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 1,
                      ),
                      child: Text(
                        'Đăng nhập ngay',
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
