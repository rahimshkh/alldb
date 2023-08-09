import 'package:alldb/controller/blocs/hive_bloc/hive_bloc.dart';
import 'package:alldb/helper/constants/app_dimensions.dart';
import 'package:alldb/helper/constants/app_icons.dart';
import 'package:alldb/helper/constants/app_sizes.dart';
import 'package:alldb/helper/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:alldb/helper/extensions/field_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/blocs/firebase_bloc/firebase_bloc.dart';

class AlertUtils {
  static addUser({
    required BuildContext context,
    required double height,
    required double width,
    required String dbLabel,
  }) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: ((context) {
          return SizedBox(
            height: height * AppSizes.kBottomSheetHeight,
            child: ListView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              children: [
                Text(
                  AppStrings.kBottomSheetLabel + dbLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: AppSizes.kBottomSheetLabel),
                ),
                Divider(
                  color: Theme.of(context).primaryColor,
                ),
                Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * AppDimension.kWidgetsSpacing),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            validator: (value) => value.toString().nameValidation(),
                            decoration: const InputDecoration(
                                label: Text(AppStrings.kNameFieldLabel),
                                prefixIcon: Icon(AppIcons.kFieldName)),
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => value.toString().emailValidation(),
                            decoration: const InputDecoration(
                                label: Text(AppStrings.kEmailFieldLabel),
                                prefixIcon: Icon(AppIcons.kFieldEmail)),
                          ),
                          SizedBox(
                            height: height * AppDimension.kWidgetsSpacing,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (dbLabel == AppStrings.kLocalDBLabel) {
                                    Navigator.pop(context);
                                    context.read<HiveBloc>().add(AddLocalDataEvent(
                                        name: nameController.text.toString().trim(),
                                        email: emailController.text.toString().trim()));
                                  } else {
                                    Navigator.pop(context);
                                    context.read<FirebaseBloc>().add(AddCloudDataEvent(
                                        name: nameController.text.toString().trim(),
                                        email: emailController.text.toString().trim()));
                                  }
                                }
                              },
                              child: const Text(AppStrings.kSaveButton))
                        ],
                      ),
                    ))
              ],
            ),
          );
        }),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.kWidgetsRadius)));
  }
}
