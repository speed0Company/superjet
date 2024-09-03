import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superjet/colors/style_color.dart';
import 'package:superjet/generated/l10n.dart';
import 'package:superjet/services/register_api.dart';
import '../../widgets/alert_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custome_text_filed.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController emailCon = TextEditingController();

  final TextEditingController nameCon = TextEditingController();

  final TextEditingController confirmPassCon = TextEditingController();

  final TextEditingController passwordCon = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading=false;

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
                isLoading: isLoading,
                text: S.of(context).register,
                onTap: ()async {

                  if (_formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});

                    try {
                      Map<String,dynamic> user = await RegisterApi().registerUser(
                        nameCon.text,
                        emailCon.text,
                        passwordCon.text,
                        confirmPassCon.text,
                      );

                      // Save token to shared preferences
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('token', user['myToken']);
                      await prefs.setString('user', jsonEncode(user)); // Use jsonEncode


                      Navigator.pop(context);
                      Navigator.pop(context,user);

                    } catch (e) {
                      showAlertDialog(context, e.toString());
                    }

                    isLoading = false;
                    setState(() {});
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
