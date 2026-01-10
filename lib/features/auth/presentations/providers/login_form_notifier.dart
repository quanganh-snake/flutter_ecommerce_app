import 'package:flutter_ecommerce/features/auth/domain/validators/email.dart';
import 'package:flutter_ecommerce/features/auth/domain/validators/password.dart';
import 'package:flutter_ecommerce/features/auth/presentations/providers/auth_service_provider.dart';
import 'package:flutter_ecommerce/features/auth/presentations/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_form_state.dart';

class LoginFormNotifier extends Notifier<LoginFormState> {
  late final AuthService _authService;

  @override
  LoginFormState build() {
    _authService = ref.read(authServiceProvider);
    return const LoginFormState();
  }

  void onEmailChanged(String value) {
    state = state.copyWith(email: EmailInput.dirty(value));
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(password: PasswordInput.dirty(value));
  }

  void togglePasswordVisibility() {
    state = state.togglePasswordVisibility();
  }

  Future<void> submit() async {
    try {
      final markedState = state.markAllDirty(state);
      state = markedState;

      if (!state.isValid) return;

      state = state.copyWith(isSubmitting: true);

      // simulate login
      final role = await _authService.login(
        email: state.email.value,
        password: state.password.value,
      );

      if (role == 'Đăng nhập thất bại' || role == null) {
        state = state.copyWith(
          role: null,
          isSubmitting: false,
          errorMessage: 'Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin.',
        );
        return;
      }

      state = state.copyWith(isSubmitting: false, role: role);
    } catch (e) {
      state = state.copyWith(
        role: null,
        isSubmitting: false,
        errorMessage: 'Đã có lỗi xảy ra. Vui lòng thử lại $e',
      );
    }
  }
}
