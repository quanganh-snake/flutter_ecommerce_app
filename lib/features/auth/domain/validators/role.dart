enum RoleValidationError { empty, invalid }

class RoleSelector {
  static const List<String> roles = ['user', 'admin'];

  final String value;
  final bool isPure;

  const RoleSelector.pure() : value = '', isPure = true;
  const RoleSelector.dirty(this.value) : isPure = false;

  RoleValidationError? get error {
    if (isPure) return null;
    if (value.isEmpty) return RoleValidationError.empty;
    if (!roles.contains(value)) return RoleValidationError.invalid;
    return null;
  }
}
