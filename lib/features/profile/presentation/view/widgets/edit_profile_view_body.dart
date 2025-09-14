import 'package:chef/core/utils/app_routes.dart';
import 'package:chef/core/utils/widgets/custom_btn.dart';
import 'package:chef/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:chef/features/profile/presentation/view/cubit/edit_cubit.dart';
import 'package:chef/features/profile/presentation/view/cubit/edit_state.dart';
import 'package:chef/features/profile/presentation/view/widgets/custom_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../cubit/user_cubit.dart';

class EditProfileViewBody extends StatelessWidget {
  EditProfileViewBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BlocConsumer<EditCubit, EditState>(
            listener: (context, state) {
              if (state is EditSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile updated successfully")),
                );
                context.read<UserCubit>().getUserData();
              } else if (state is EditFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              }
            },
            builder: (context, state) {
              final editCubit = context.read<EditCubit>();

              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    const CustomProfileImage(),
                    const SizedBox(height: 24),

                    // Name
                    CustomTextField(
                      hintText: 'Name',
                      onChanged: (value) => editCubit.name = value,
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Name is required"
                          : null,
                    ),
                    const SizedBox(height: 24),

                    // Email
                    CustomTextField(
                      hintText: 'E-mail',
                      onChanged: (value) => editCubit.email = value,
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Email is required"
                          : null,
                    ),
                    const SizedBox(height: 24),

                    // Phone
                    CustomTextField(
                      hintText: 'Phone',
                      onChanged: (value) => editCubit.phone = value,
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Phone is required"
                          : null,
                    ),
                    const SizedBox(height: 24),

                    // Brand Name
                    CustomTextField(
                      hintText: 'Brand Name',
                      onChanged: (value) => editCubit.brandName = value,
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Brand Name is required"
                          : null,
                    ),
                    const SizedBox(height: 24),

                    // Description
                    CustomTextField(
                      hintText: 'Description',
                      onChanged: (value) => editCubit.desc = value,
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Description is required"
                          : null,
                    ),
                    const SizedBox(height: 34),

                    // Update Button
                    state is EditLoading
                        ? const CircularProgressIndicator()
                        : CustomBtn(
                            text: 'Update',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final user =
                                    Supabase.instance.client.auth.currentUser;
                                editCubit.saveProfile(
                                    user!.id,
                                    user.email ?? '',
                                    user.userMetadata!['photoUrl']);
                              }
                            },
                          ),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
