import '../../domain/validators/confirmpassword.dart';
import '../../domain/validators/email.dart';
import '../../domain/validators/fullname.dart';
import '../../domain/validators/password.dart';
import '../../domain/validators/role.dart';

class SignupFormState {
  final FullnameInput fullName;
  final EmailInput email;
  final PasswordInput password;
  final ConfirmpasswordInput confirmPassword;
  final RoleSelector role;
  final bool isSubmitting;
  final bool isShowPassword;
  final bool isShowConfirmPassword;
  final bool isSuccess;
  final String? submitError;

  const SignupFormState({
    this.fullName = const FullnameInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmpasswordInput.pure(),
    this.role = const RoleSelector.pure(),
    this.isSubmitting = false,
    this.isShowPassword = false,
    this.isShowConfirmPassword = false,
    this.isSuccess = false,
    this.submitError,
  });

  bool get isValid =>
      email.isValid && password.isValid && confirmPassword.isValid;

  SignupFormState copyWith({
    FullnameInput? fullName,
    EmailInput? email,
    PasswordInput? password,
    ConfirmpasswordInput? confirmPassword,
    RoleSelector? role,
    bool? isSubmitting,
    bool? isShowPassword,
    bool? isShowConfirmPassword,
    bool? isSuccess,
    String? submitError,
  }) {
    return SignupFormState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      role: role ?? this.role,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowConfirmPassword:
          isShowConfirmPassword ?? this.isShowConfirmPassword,
      isSuccess: isSuccess ?? this.isSuccess,
      submitError: submitError,
    );
  }

  SignupFormState markAllDirty() {
    return copyWith(
      fullName: FullnameInput.dirty(fullName.value),
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
