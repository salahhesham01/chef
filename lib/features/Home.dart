import 'package:chef/features/meal/presentation/view/meal_view.dart';
import 'package:chef/features/profile/presentation/view/cubit/profile_imge_cubit.dart';
import 'package:chef/features/profile/presentation/view/cubit/user_cubit.dart';
import 'package:chef/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'meal/presentation/view/cubit/get_meal_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MealView(),
    const ProfileView(),
  ];

  @override
  void initState() {
    super.initState();

    /// 🔥 Listen to Supabase auth state changes
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final session = data.session;

      if (session != null) {
        // ✅ User signed in → refresh data
        context.read<UserCubit>().getUserData();
        context.read<ProfileImageCubit>().getProfileImage();
        context.read<GetMealCubit>().getMeals();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            label: "Meal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
