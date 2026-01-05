enum PasswordValidationError { empty, tooShort }

class PasswordInput {
  final String value;
  final bool isPure;

  const PasswordInput.pure() : value = '', isPure = true;
  const PasswordInput.dirty(this.value) : isPure = false;

  PasswordValidationError? get error {
    if (isPure) return null;
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value.length < 6) return PasswordValidationError.tooShort;
    return null;
  }

  bool get isValid => error == null;
}
