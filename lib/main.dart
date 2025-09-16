import 'package:chef/core/utils/app_routes.dart';
import 'package:chef/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chef/features/auth/domain/usecases/authUseCase/send_reset_password_use_case.dart';
import 'package:chef/features/auth/domain/usecases/authUseCase/sing_in_use_case.dart';
import 'package:chef/features/meal/data/data_source/meal_remote_data_source.dart';
import 'package:chef/features/meal/data/repo/meal_repo_impl.dart';
import 'package:chef/features/meal/domain/use_case/add_meal_use_case.dart';
import 'package:chef/features/meal/domain/use_case/delete_meal_use_case.dart';
import 'package:chef/features/meal/presentation/view/cubit/add_meal_cubit.dart';
import 'package:chef/features/meal/presentation/view/cubit/delete_meal_cubit.dart';
import 'package:chef/features/profile/data/data_sources/user_remote_data_sources.dart';
import 'package:chef/features/profile/data/repos/user_repo_impl.dart';
import 'package:chef/features/profile/domain/useCase/userUseCase/change_password_use_case.dart';
import 'package:chef/features/profile/domain/useCase/userUseCase/fetch_user_use_case.dart';
import 'package:chef/features/profile/domain/useCase/userUseCase/get_profile_image_url.dart';
import 'package:chef/features/profile/domain/useCase/userUseCase/update_user_profile_use_case.dart';
import 'package:chef/features/profile/domain/useCase/userUseCase/upload_profile_image.dart';
import 'package:chef/features/profile/presentation/view/cubit/change_password_cubit.dart';
import 'package:chef/features/profile/presentation/view/cubit/edit_cubit.dart';
import 'package:chef/features/profile/presentation/view/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/domain/usecases/authUseCase/reset_passwoed_use_case.dart';
import 'features/auth/presentation/views/cubit/forgetPassword/forget_password_cubit.dart';
import 'features/auth/presentation/views/cubit/sign_in/sing_in_cubit.dart';
import 'features/meal/domain/use_case/get_meal_use_case.dart';
import 'features/meal/presentation/view/cubit/get_meal_cubit.dart';
import 'features/profile/presentation/view/cubit/profile_imge_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ewtrkhnxtsaybanbjqeb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV3dHJraG54dHNheWJhbmJqcWViIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTcwOTQxNjAsImV4cCI6MjA3MjY3MDE2MH0.WRxwrcFdIsj5UyDifK-IWeeRsR-rQN0wWJUiDPBN5k8',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => SingInCubit(SignInUseCase(
                AuthRepositoryImpl(supabase: Supabase.instance.client)))),
        BlocProvider(
          create: (_) => ForgetPasswordCubit(
              sendResetPasswordUseCase: SendResetPasswordUseCase(
                  AuthRepositoryImpl(supabase: Supabase.instance.client)),
              resetPasswordUseCase: ResetPasswordUseCase(
                  AuthRepositoryImpl(supabase: Supabase.instance.client))),
        ),
        BlocProvider(
            create: (_) => UserCubit(FetchUserUseCase(UserRepoImpl(
                userRemoteDataSources: UserRemoteDataSourcesImpl(
                    supabase: Supabase.instance.client))))),
        BlocProvider(
            create: (_) => ProfileImageCubit(
                getProfileImageUrlUseCase: GetProfileImageUrl(UserRepoImpl(
                    userRemoteDataSources: UserRemoteDataSourcesImpl(
                        supabase: Supabase.instance.client))),
                uploadProfileImageUseCase: UploadProfileImage(UserRepoImpl(
                    userRemoteDataSources: UserRemoteDataSourcesImpl(
                        supabase: Supabase.instance.client))))),
        BlocProvider(
            create: (_) => EditCubit(
                  UpdateUserProfileUseCase(UserRepoImpl(
                      userRemoteDataSources: UserRemoteDataSourcesImpl(
                          supabase: Supabase.instance.client))),
                )),
        BlocProvider(
            create: (_) => ChangePasswordCubit(ChangePasswordUseCase(
                UserRepoImpl(
                    userRemoteDataSources: UserRemoteDataSourcesImpl(
                        supabase: Supabase.instance.client))))),
        BlocProvider(
            create: (_) => AddMealCubit(AddMealUseCase(MealRepoImpl(
                MealRemoteDataSourceImpl(Supabase.instance.client))))),
        BlocProvider(
            create: (_) => GetMealCubit(GetMealUseCase(MealRepoImpl(
                MealRemoteDataSourceImpl(Supabase.instance.client))))),
        BlocProvider(
            create: (_) => DeleteMealCubit(DeleteMealUseCase(MealRepoImpl(
                MealRemoteDataSourceImpl(Supabase.instance.client))))),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
