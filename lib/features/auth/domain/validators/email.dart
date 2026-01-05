enum EmailValidationError { empty, invalid }

class EmailInput {
  final String value;
  final bool isPure;

  const EmailInput.pure() : value = '', isPure = true;
  const EmailInput.dirty(this.value) : isPure = false;

  EmailValidationError? get error {
    if (isPure) return null;
    if (value.isEmpty) return EmailValidationError.empty;

    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regex.hasMatch(value)) {
      return EmailValidationError.invalid;
    }
    return null;
  }

  bool get isValid => error == null;
}
