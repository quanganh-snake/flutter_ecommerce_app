import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/auth/domain/validators/email.dart';
import 'package:flutter_ecommerce/features/auth/domain/validators/password.dart';
import 'package:flutter_ecommerce/features/auth/presentations/providers/login_form_provider.dart';
import 'package:flutter_ecommerce/features/auth/presentations/screens/signup_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(loginFormProvider);
    final notifier = ref.read(loginFormProvider.notifier);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 253, 249),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 32, right: 32),
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
              Text(
                'Enter your email',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 4),
              TextField(
                onChanged: notifier.onEmailChanged,
                decoration: InputDecoration(
                  errorText: form.email.error == EmailValidationError.empty
                      ? 'Email is required'
                      : form.email.error == EmailValidationError.invalid
                      ? 'Invalid email'
                      : null,
                  errorStyle: TextStyle(color: Colors.redAccent),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
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
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusColor: Colors.orange,
                ),
                cursorColor: Colors.orange,
              ),
              const SizedBox(height: 16),
              Text(
                'Enter your password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 4),
              TextFormField(
                obscureText: true,
                onChanged: notifier.onPasswordChanged,
                decoration: InputDecoration(
                  errorText:
                      form.password.error == PasswordValidationError.empty
                      ? 'Password is required'
                      : form.password.error == PasswordValidationError.tooShort
                      ? 'Min 6 characters'
                      : null,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  suffixIcon: Icon(
                    Icons.remove_red_eye_rounded,
                    color: Colors.grey,
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
                      ? const CircularProgressIndicator()
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
                  const Text("Don't have an account?"),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (_) => SignupScreen()));
                    },
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: const Text(
                        'Sign Up Now',
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
