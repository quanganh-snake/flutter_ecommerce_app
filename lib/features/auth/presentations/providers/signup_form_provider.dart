import 'signup_form_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'signup_form_state.dart';

final signupNotifierProvider =
    NotifierProvider<SignupNotifier, SignupFormState>(SignupNotifier.new);
