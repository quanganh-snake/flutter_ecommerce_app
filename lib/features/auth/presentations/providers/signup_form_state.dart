import 'package:flutter_ecommerce/features/auth/domain/validators/confirmpassword.dart';
import 'package:flutter_ecommerce/features/auth/domain/validators/email.dart';
import 'package:flutter_ecommerce/features/auth/domain/validators/password.dart';

class SignupFormState {
  final EmailInput email;
  final PasswordInput password;
  final ConfirmpasswordInput confirmPassword;
  final String role;
  final bool isSubmitting;
  final bool isShowPassword;
  final bool isShowConfirmPassword;

  const SignupFormState({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmpasswordInput.pure(),
    this.role = 'user',
    this.isSubmitting = false,
    this.isShowPassword = false,
    this.isShowConfirmPassword = false,
  });

  bool get isValid =>
      email.isValid && password.isValid && confirmPassword.isValid;

  SignupFormState copyWith({
    EmailInput? email,
    PasswordInput? password,
    String? role,
    bool? isSubmitting,
    bool? isShowPassword,
    bool? isShowConfirmPassword,
    ConfirmpasswordInput? confirmPassword,
  }) {
    return SignupFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      role: role ?? this.role,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowConfirmPassword:
          isShowConfirmPassword ?? this.isShowConfirmPassword,
    );
  }

  SignupFormState markAllDirty() {
    return copyWith(
      email: EmailInput.dirty(email.value),
      password: PasswordInput.dirty(password.value),
      confirmPassword: ConfirmpasswordInput.dirty(
        password: password.value,
        value: confirmPassword.value,
      ),
      role: role,
    );
  }

  SignupFormState togglePasswordVisibility() {
    return copyWith(isShowPassword: !isShowPassword);
  }

  SignupFormState toggleConfirmPasswordVisibility() {
    return copyWith(isShowConfirmPassword: !isShowConfirmPassword);
  }
}
