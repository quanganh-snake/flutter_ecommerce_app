import 'package:flutter_ecommerce/features/auth/presentations/providers/login_form_notifier.dart';
import 'package:flutter_ecommerce/features/auth/presentations/providers/login_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormProvider = NotifierProvider<LoginFormNotifier, LoginFormState>(
  () => LoginFormNotifier(),
);
