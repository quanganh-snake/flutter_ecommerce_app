enum FullnameValidationError { pure, valid, empty, tooShort, tooLong }

class FullnameInput {
  final String value;
  final bool isPure;

  const FullnameInput.pure() : value = '', isPure = true;
  const FullnameInput.dirty(this.value) : isPure = false;

  FullnameValidationError get status {
    if (isPure) return FullnameValidationError.pure;
    if (value.isEmpty) return FullnameValidationError.empty;
    if (value.length < 3) return FullnameValidationError.tooShort;
    if (value.length > 50) return FullnameValidationError.tooLong;
    return FullnameValidationError.valid;
  }

  bool get isValid => status == FullnameValidationError.valid;

  String? get error {
    if (status == FullnameValidationError.empty)
      return 'Họ và tên không được để trống';
    if (status == FullnameValidationError.tooShort)
      return 'Họ và tên tối thiểu 3 ký tự';
    if (status == FullnameValidationError.tooLong)
      return 'Họ và tên không được quá 50 ký tự';
    return null;
  }
}
