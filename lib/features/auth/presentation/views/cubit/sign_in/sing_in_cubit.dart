import 'package:chef/features/auth/presentation/views/cubit/sign_in/sing_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/authUseCase/sing_in_use_case.dart';

class SingInCubit extends Cubit<SingInState> {
  String? email;
  String? password;
  bool obscureText = true;

  final SignInUseCase signInUseCase;

  SingInCubit(this.signInUseCase) : super(SingInInitial());

  Future<void> signIn() async {
    emit(SingInLoading());

    final result = await signInUseCase(
      SignInParams(email: email!, password: password!),
    );

    result.fold(
      (failure) => emit(SingInFailure(errMsg: failure.msg)),
      (user) => emit(SingInSuccess(user)),
    );
  }

  void obscurePasswordText() {
    obscureText = !obscureText;
    emit(SingInPasswordVisibilityChanged(obscureText));
  }
}
