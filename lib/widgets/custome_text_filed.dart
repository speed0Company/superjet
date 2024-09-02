import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/style_color.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPasswordField = false,
    this.validator,
    this.maxLength,
    this.focusNode, // New parameter
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final int? maxLength;
  final FocusNode? focusNode; // New parameter

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShown = false;

  @override
  void initState() {
    super.initState();
    isShown = !widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: TextFormField(
        cursorColor: headTitleColor,
        focusNode: widget.focusNode, // Ensure correct focus is applied
        maxLength: widget.maxLength,
        validator: widget.validator,
        obscureText: widget.isPasswordField && !isShown,
        controller: widget.controller,
        keyboardType: widget.isPasswordField
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        decoration: InputDecoration(
          suffixIcon: widget.isPasswordField
              ? IconButton(
            onPressed: () {
              setState(() {
                isShown = !isShown; // Toggle password visibility
              });
            },
            icon: Padding(
              padding: EdgeInsets.only(
                left: Localizations.localeOf(context).languageCode == "ar"
                    ? 10
                    : 0,
                right: Localizations.localeOf(context).languageCode == "en"
                    ? 10
                    : 0,
              ),
              child: Image.asset(
                isShown
                    ? 'assets/images/show_icon.png'
                    : 'assets/images/hide_icon.png',
                width: 25,
                height: 30,
              ),
            ),
          )
              : null,
          hintText: widget.hintText,
          hintStyle: GoogleFonts.cairo(
            fontSize: 15.sp,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: headTitleColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
