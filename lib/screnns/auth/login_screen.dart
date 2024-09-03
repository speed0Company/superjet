import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superjet/colors/style_color.dart';
import 'package:superjet/generated/l10n.dart';
import '../../widgets/alert_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custome_text_filed.dart';
import 'create_account_screen.dart';
import 'package:superjet/services/login_api.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool isLoading = false; // Loading state

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
          key: formKey,
          child: Column(
            children: [
              // Email field
              CustomTextField(
                controller: emailCon,
                hintText: S.of(context).email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).email_required;
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return S.of(context).invalid_email;
                  }
                  return null;
                },
                focusNode: emailFocusNode,
              ),
              // Password field
              CustomTextField(
                controller: passwordCon,
                hintText: S.of(context).password,
                isPasswordField: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).password_required;
                  } else if (value.length < 6) {
                    return S.of(context).password_too_short;
                  }
                  return null;
                },
                focusNode: passwordFocusNode,
              ),
              // Login button
              CustomButton(
                isLoading: isLoading, // Show loading state
                text: S.of(context).login,
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true; // Start loading
                    });

                    try {
                      // Call your API to log in
                      Map<String,dynamic> user = await LoginApi().LoginUser(
                        emailCon.text,
                        passwordCon.text,
                      );

                      // Save token to shared preferences
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('token', user['myToken']);
                      await prefs.setString('user', jsonEncode(user));

                      // Pop the screen and return true
                      Navigator.pop(context, user);
                    } catch (e) {
                      // Handle login error
                      showAlertDialog(context, e.toString());
                    }

                    setState(() {
                      isLoading = false; // Stop loading
                    });
                  }
                },
              ),
              // Register new account link
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAccountScreen(),
                    ),
                  );
                },
                child: Text(
                  S.of(context).register_new_acc,
                  style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    color: headTitleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}