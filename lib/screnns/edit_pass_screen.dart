import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superjet/generated/l10n.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custome_text_filed.dart';

class EditPassScreen extends StatefulWidget {
  EditPassScreen({super.key});

  @override
  State<EditPassScreen> createState() => _EditPassScreenState();
}

class _EditPassScreenState extends State<EditPassScreen> {
  final TextEditingController confirmPassCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController oldPasswordCon = TextEditingController();

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
                controller: oldPasswordCon,
                hintText: S.of(context).old_pass,
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
                controller: passwordCon,
                hintText: S.of(context).new_pass,
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
                hintText: S.of(context).confirm_new_pass,
                isPasswordField: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).password_required; // Add this in your localization
                  } else if (value != passwordCon.text) {
                    return S.of(context).passwords_do_not_match; // Add this in your localization
                  }
                  return null;
                },
              ),


              CustomButton(
                text: S.of(context).save,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform registration logic
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
