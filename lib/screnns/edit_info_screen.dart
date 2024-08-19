import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superjet/generated/l10n.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custome_text_filed.dart';

class EditInfoScreen extends StatefulWidget {
  EditInfoScreen({super.key});

  @override
  State<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  final TextEditingController emailCon = TextEditingController();

  final TextEditingController nameCon = TextEditingController();

  final _formKey = GlobalKey<FormState>();
@override
  void initState() {
    nameCon.text="محمد علي";
    emailCon.text="test@test.com";
    super.initState();
  }
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
