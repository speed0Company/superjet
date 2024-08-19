import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';
import 'package:superjet/generated/l10n.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custome_text_filed.dart';

import 'create_account_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final TextEditingController emailCon=TextEditingController();
  final TextEditingController passwordCon=TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        notificationPredicate: (_) => false,

        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: (){
            Navigator.pop(context);
          },

        ),
      ),
      body:SingleChildScrollView(
        child: Form(
          key:_formKey ,
          child: Column(
            children: [
              CustomTextField(
              controller: emailCon,hintText: S.of(context).email,
              validator: (value) {
              if (value == null || value.isEmpty) {
              return S.of(context).email_required;
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return S.of(context).invalid_email;
              }
              return null;
            },
              ),
              CustomTextField(
                controller:passwordCon,
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
              CustomButton(
                text: S.of(context).login,
                onTap: (){
                  if (_formKey.currentState!.validate()) {

                  }
                },
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen(),));
                },
                child: Text(S.of(context).register_new_acc,

                style:GoogleFonts.cairo(
                    fontSize: 16.sp,
                    color: headTitleColor,
                    fontWeight: FontWeight.bold
                ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


