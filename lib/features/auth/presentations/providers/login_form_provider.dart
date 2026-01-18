import 'login_form_notifier.dart';
import 'login_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormProvider = NotifierProvider<LoginFormNotifier, LoginFormState>(
  () => LoginFormNotifier(),
);
