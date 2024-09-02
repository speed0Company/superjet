import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';
import 'package:superjet/generated/l10n.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custome_text_filed.dart';
import 'create_account_screen.dart';

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
                // Use FocusNode to manage focus state
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
                focusNode: passwordFocusNode, // Add focus node here too
              ),
              // Login button
              CustomButton(
                text: S.of(context).login,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    print("usf");
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
