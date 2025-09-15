import 'package:chef/features/Home.dart';
import 'package:chef/features/auth/presentation/views/forget_password_view.dart';
import 'package:chef/features/auth/presentation/views/sign_in_view.dart';
import 'package:chef/features/meal/presentation/view/meal_view.dart';
import 'package:chef/features/meal/presentation/view/widgets/add_meal.dart';
import 'package:chef/features/profile/presentation/view/change_password_view.dart';
import 'package:chef/features/profile/presentation/view/edit_profile_view.dart';
import 'package:chef/features/profile/presentation/view/profile_view.dart';
import 'package:chef/features/profile/presentation/view/settings_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/widgets/new_password.dart';
import '../../features/splash/presentation/view/splash_view.dart';

abstract class AppRoutes {
  static const kSingInView = '/singInView';
  static const kForgetView = '/ForgetView';
  static const kHomeView = '/homeView';
  static const kMealView = '/mealView';
  static const kEditProfileView = '/editProfileView';
  static const kSettingsView = '/settingsView';
  static const kChangePasswordView = '/changePasswordView';
  static const kAddMealView = '/addMealView';
  static const kNewPassword = '/new-password';
  static const kProfileView = '/profileView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kSingInView,
        builder: (context, state) {
          return const SignInView();
        },
      ),
      GoRoute(
        path: kForgetView,
        builder: (context, state) {
          return const ForgetPasswordView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: kMealView,
        builder: (context, state) {
          return const MealView();
        },
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) {
          return const EditProfileView();
        },
      ),
      GoRoute(
        path: kNewPassword,
        builder: (context, state) => const NewPassword(),
      ),
      GoRoute(
        path: kSettingsView,
        builder: (context, state) {
          return const SettingsView();
        },
      ),
      GoRoute(
        path: kChangePasswordView,
        builder: (context, state) {
          return const ChangePasswordView();
        },
      ),
      GoRoute(
        path: kAddMealView,
        builder: (context, state) {
          return AddMeal();
        },
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) {
          return const ProfileView();
        },
      ),
    ],
  );
}
