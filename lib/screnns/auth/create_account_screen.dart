import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superjet/generated/l10n.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custome_text_filed.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final TextEditingController emailCon = TextEditingController();
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        notificationPredicate: (_) => false,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                    controller: nameCon,
                    hintText: S.of(context).name,
                    maxLength: 50,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).name_required; // Add this in your localization
                      } else if (value.length < 4) {
                        return S.of(context).name_too_short; // Add this in your localization
                      } else if (value.length > 50) {
                        return S.of(context).name_too_long; // Add this in your localization
                      }
                      return null;
                    },
                  ),
              CustomTextField(
                controller: emailCon,
                hintText: S.of(context).email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).email_required; // Add this in your localization
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return S.of(context).invalid_email; // Add this in your localization
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: passwordCon,
                hintText: S.of(context).password,
                isPasswordField: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).password_required; // Add this in your localization
                  } else if (value.length < 6) {
                    return S.of(context).password_too_short; // Add this in your localization
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: confirmPassCon,
                hintText: S.of(context).confirm_password,
                isPasswordField: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).confirm_password_required; // Add this in your localization
                  } else if (value != passwordCon.text) {
                    return S.of(context).passwords_do_not_match; // Add this in your localization
                  }
                  return null;
                },
              ),
              CustomButton(
                text: S.of(context).register,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform registration logic
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
