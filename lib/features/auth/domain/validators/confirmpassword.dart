enum ConfirmPasswordValidationError { empty, notMatch }

class ConfirmpasswordInput {
  final String value;
  final String password; // 👈 password gốc
  final bool isPure;

  const ConfirmpasswordInput.pure({this.password = ''})
    : value = '',
      isPure = true;
  const ConfirmpasswordInput.dirty({
    required this.password,
    required this.value,
  }) : isPure = false;

  ConfirmPasswordValidationError? get error {
    if (isPure) return null;
    if (value.isEmpty) {
      return ConfirmPasswordValidationError.empty;
    }

    if (value != password) {
      return ConfirmPasswordValidationError.notMatch;
    }
    return null;
  }

  bool get isValid => error == null;
}
