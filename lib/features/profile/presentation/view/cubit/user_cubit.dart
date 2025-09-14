import 'package:bloc/bloc.dart';
import 'package:chef/features/profile/domain/useCase/userUseCase/fetch_user_use_case.dart';
import 'package:chef/features/profile/presentation/view/cubit/user_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.fetchUserUseCase) : super(UserInitial());

  final FetchUserUseCase fetchUserUseCase;

  Future<void> getUserData() async {
    emit(UserLoading());

    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    final result = await fetchUserUseCase(UserParams(uId: user!.id));

    result.fold(
      (failure) => emit(UserFailure(errMsg: failure.msg)),
      (userEntity) => emit(UserSuccess(userEntity)),
    );
  }

  Future<void> signOut() async {
    emit(UserLoading());
    final supabase = Supabase.instance.client;

    try {
      await supabase.auth.signOut();
      emit(UserSignOutSuccess());
    } catch (e) {
      emit(UserSignOutFailure(errMsg: e.toString()));
    }
  }
}
