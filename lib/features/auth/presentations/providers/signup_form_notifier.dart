import 'package:flutter_ecommerce/features/auth/domain/validators/fullname.dart';
import 'package:flutter_ecommerce/features/auth/domain/validators/role.dart';
import 'package:flutter_ecommerce/features/auth/presentations/providers/auth_service_provider.dart';
import 'package:flutter_ecommerce/features/auth/presentations/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'signup_form_state.dart';
import '../../domain/validators/email.dart';
import '../../domain/validators/password.dart';
import '../../domain/validators/confirmpassword.dart';

class SignupNotifier extends Notifier<SignupFormState> {
  late final AuthService _authService;

  @override
  SignupFormState build() {
    _authService = ref.read(authServiceProvider);
    return const SignupFormState();
  }

  // =========================
  // FULL NAME
  // =========================
  void onFullNameChanged(String value) {
    state = state.copyWith(fullName: FullnameInput.dirty(value));
  }

  // =========================
  // EMAIL
  // =========================
  void onEmailChanged(String value) {
    state = state.copyWith(email: EmailInput.dirty(value));
  }

  // =========================
  // PASSWORD
  // =========================
  void onPasswordChanged(String value) {
    final password = PasswordInput.dirty(value);

    // 🔥 QUAN TRỌNG: re-validate confirmPassword khi password đổi
    final confirmPassword = ConfirmpasswordInput.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );

    state = state.copyWith(
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  // =========================
  // CONFIRM PASSWORD
  // =========================
  void onConfirmPasswordChanged(String value) {
    final confirmPassword = ConfirmpasswordInput.dirty(
      value: value,
      password: state.password.value,
    );

    state = state.copyWith(confirmPassword: confirmPassword);
  }

  // =========================
  // ROLE
  // =========================
  void onRoleChanged(String value) {
    state = state.copyWith(role: RoleSelector.dirty(value));
  }

  // =========================
  // TOGGLE VISIBILITY
  // =========================
  void togglePasswordVisibility() {
    state = state.copyWith(isShowPassword: !state.isShowPassword);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(isShowConfirmPassword: !state.isShowConfirmPassword);
  }

  // =========================
  // SUBMIT
  // =========================
  Future<void> submit() async {
    // 1️⃣ Mark all dirty để show error
    state = state.markAllDirty();

    // 2️⃣ Check valid
    if (!state.isValid) return;

    // 3️⃣ Submit
    state = state.copyWith(isSubmitting: true);

    try {
      final error = await _authService.signup(
        email: state.email.value,
        password: state.password.value,
        fullName: state.fullName.value,
        role: state.role.value,
      );

      if (error != null) {
        // 🔥 Firebase error
        state = state.copyWith(submitError: error);
        return;
      }

      // ✅ Success
      state = state.copyWith(isSubmitting: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(isSubmitting: false, isSuccess: false);
    } finally {
      state = state.copyWith(isSubmitting: false, isSuccess: false);
    }
  }
}
