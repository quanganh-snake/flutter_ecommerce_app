import 'package:flutter_ecommerce/features/auth/domain/validators/email.dart';
import 'package:flutter_ecommerce/features/auth/domain/validators/password.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_form_state.dart';

class LoginFormNotifier extends Notifier<LoginFormState> {
  @override
  LoginFormState build() {
    return const LoginFormState();
  }

  void onEmailChanged(String value) {
    state = state.copyWith(email: EmailInput.dirty(value));
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(password: PasswordInput.dirty(value));
  }

  Future<void> submit() async {
    final markedState = state.markAllDirty(state);
    state = markedState;

    if (!state.isValid) return;

    state = state.copyWith(isSubmitting: true);

    // simulate login
    await Future.delayed(const Duration(seconds: 1));

    state = state.copyWith(isSubmitting: false);
  }
}
