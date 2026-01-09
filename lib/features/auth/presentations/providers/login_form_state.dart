import 'package:flutter_ecommerce/features/auth/domain/validators/email.dart';
import 'package:flutter_ecommerce/features/auth/domain/validators/password.dart';

class LoginFormState {
  final EmailInput email;
  final PasswordInput password;
  final bool isSubmitting;
  final bool isShowPassword;
  final String? errorMessage;
  final String? role;

  const LoginFormState({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.isSubmitting = false,
    this.isShowPassword = false,
    this.errorMessage,
    this.role,
  });

  bool get isValid => email.isValid && password.isValid;

  LoginFormState copyWith({
    EmailInput? email,
    PasswordInput? password,
    bool? isShowPassword,
    bool? isSubmitting,
    String? errorMessage,
    String? role,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      errorMessage: errorMessage ?? this.errorMessage,
      role: role ?? this.role,
    );
  }

  LoginFormState markAllDirty(LoginFormState state) {
    return state.copyWith(
      email: EmailInput.dirty(state.email.value),
      password: PasswordInput.dirty(state.password.value),
    );
  }

  LoginFormState togglePasswordVisibility() {
    return LoginFormState(
      email: email,
      password: password,
      isSubmitting: isSubmitting,
      isShowPassword: !isShowPassword,
    );
  }
}
