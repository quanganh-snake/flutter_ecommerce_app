import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'signup_form_state.dart';
import '../../domain/validators/email.dart';
import '../../domain/validators/password.dart';
import '../../domain/validators/confirmpassword.dart';

class SignupNotifier extends Notifier<SignupFormState> {
  @override
  SignupFormState build() {
    return const SignupFormState();
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
      // TODO: call API signup
      await Future.delayed(const Duration(seconds: 2));

      // TODO: handle success
    } catch (e) {
      // TODO: handle error
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }
}
