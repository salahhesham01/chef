import 'package:chef/core/utils/widgets/custom_btn.dart';
import 'package:chef/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:chef/features/meal/presentation/view/cubit/add_meal_cubit.dart';
import 'package:chef/features/meal/presentation/view/cubit/add_meal_state.dart';
import 'package:chef/features/meal/presentation/view/cubit/get_meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';

class AddMeal extends StatelessWidget {
  AddMeal({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Add Meal',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: primaryColor,
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: BlocConsumer<AddMealCubit, AddMealState>(
                    listener: (context, state) {
                      if (state is AddMealFailure) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.msg)));
                      } else if (state is AddMealSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Meal added")));
                        context.read<GetMealCubit>().getMeals();
                        Navigator.of(context).pop();
                      }
                    },
                    builder: (context, state) {
                      final addMealCubit =
                          BlocProvider.of<AddMealCubit>(context);
                      return Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: 'Name',
                              onChanged: (value) {
                                addMealCubit.name = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            CustomTextField(
                              hintText: 'Price',
                              onChanged: (value) {
                                addMealCubit.price = double.tryParse(value);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Price is required';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Price must be a number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            CustomTextField(
                              hintText: 'Category',
                              onChanged: (value) {
                                addMealCubit.category = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Category is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            CustomTextField(
                              hintText: 'Description',
                              onChanged: (value) {
                                addMealCubit.description = value;
                              },
                              validator: (value) {
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 33,
                            ),
                            state is AddMealLoading
                                ? const CircularProgressIndicator()
                                : CustomBtn(
                                    text: 'Add Meal',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        addMealCubit.addMeal();
                                      }
                                    },
                                  ),
                            const SizedBox(
                              height: 11,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            )));
  }
}
