import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
     this.isPasswordField=false,
     this.validator,
     this.maxLength

  });

  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final int? maxLength;


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShown=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: TextFormField(
        maxLength: widget.maxLength!=null?widget.maxLength:null,
        validator: widget.validator,
        obscureText: isShown,
        controller: widget.controller,
        keyboardType:widget.isPasswordField?TextInputType.visiblePassword:TextInputType.emailAddress,
        decoration: InputDecoration(
            suffixIcon: widget.isPasswordField?IconButton(
              onPressed: (){
                isShown=!isShown;
                setState(() {

                });
              },
              icon:Padding(

                padding:  EdgeInsets.only(left:Localizations.localeOf(context).languageCode=="ar"?
                10:0,right:Localizations.localeOf(context).languageCode=="en"?10:0  ),

                child: Image.asset(isShown?'assets/images/show_icon.png':'assets/images/hide_icon.png',width: 25,height: 30,),

              ),

            ):null,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.cairo(
                fontSize: 15.sp,
                color: Colors.grey
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            )

        ),

      ),
    );
  }
}
