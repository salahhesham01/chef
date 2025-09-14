import 'package:bloc/bloc.dart';
import 'package:chef/features/profile/domain/useCase/userUseCase/update_user_profile_use_case.dart';

import '../../../../../core/entity/user_entity.dart';
import '../../../domain/entity/profile_entity.dart';
import 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit(this.updateUserProfileUseCase) : super(EditInitial());
  final UpdateUserProfileUseCase updateUserProfileUseCase;

  String? name;
  String? phone;
  String? desc;
  String? email;
  String? brandName;
  void saveProfile(String uId, String email, String? photoUrl) {
    final profile = ProfileEntity(
      userEntity: UserEntity(
        uId: uId,
        email: email,
        name: name ?? '',
        photoUrl: photoUrl,
      ),
      phone: phone ?? '',
      brandName: brandName ?? '',
      desc: desc ?? '',
    );

    updateUserProfile(UpdateUserParams(userModel: profile));
  }

  void updateUserProfile(UpdateUserParams params) async {
    emit(EditLoading());

    final result = await updateUserProfileUseCase(params);
    result.fold(
      (failure) => emit(EditFailure(failure.msg)),
      (user) => emit(EditSuccess(user)),
    );
  }
}
