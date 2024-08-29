import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../colors/style_color.dart';
import '../generated/l10n.dart'; // Add this for localization

class ExploerEgyScreen extends StatefulWidget {
  @override
  _ExploerEgyScreenState createState() => _ExploerEgyScreenState();
}

class _ExploerEgyScreenState extends State<ExploerEgyScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            S.of(context).selectImageSourceTitle,
            style: GoogleFonts.cairo(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: headTitleColor
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).selectImageSourceText,
                style: GoogleFonts.cairo(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      _pickImage(ImageSource.camera);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _pickImage(ImageSource.camera);
                          },
                          icon: Icon(Icons.camera,color: thirdTripColor,),
                        ),
                        Text(
                          S.of(context).cameraOption,
                          style: GoogleFonts.cairo(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 7),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      _pickImage(ImageSource.gallery);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _pickImage(ImageSource.gallery);
                          },
                          icon: Icon(Icons.image,color: thirdTripColor,),
                        ),
                        Text(
                          S.of(context).galleryOption,
                          style: GoogleFonts.cairo(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    cityController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCF3E8),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 4,
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Image.asset(
          Localizations.localeOf(context)
              .languageCode ==
              "ar"
              ? "assets/images/superjet_logo.png"
              : "assets/images/logo_english.png",
          width: 90,
          height: 90,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Padding(
          padding: EdgeInsets.only(
            top: 25.h,
            left: 5.w,
            right: 5.w,
          ),
          child: Column(
            children: [
              Text(
                S.of(context).explorerEgyTitle,
                style: GoogleFonts.cairo(
                  color: headTitleColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).firstNameLabel,
                                  style: GoogleFonts.cairo(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffd3d3d3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: TextField(
                                      cursorColor: headTitleColor,
                                      controller: firstNameController,
                                      decoration: InputDecoration(
                                        hintText: S.of(context).firstNameHint,
                                        hintStyle: GoogleFonts.cairo(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).lastNameLabel,
                                  style: GoogleFonts.cairo(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffd3d3d3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: TextField(
                                      cursorColor: headTitleColor,
                                      controller: lastNameController,
                                      decoration: InputDecoration(
                                        hintText: S.of(context).lastNameHint,
                                        hintStyle: GoogleFonts.cairo(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).cityLabel,
                                  style: GoogleFonts.cairo(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffd3d3d3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: TextField(
                                      cursorColor: headTitleColor,
                                      controller: cityController,
                                      decoration: InputDecoration(
                                        hintText: S.of(context).cityHint,
                                        hintStyle: GoogleFonts.cairo(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).uploadImageLabel,
                                  style: GoogleFonts.cairo(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                ElevatedButton(

                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Color(0xffd3d3d3)),
                                          borderRadius: BorderRadius.circular(10))),
                                  onPressed: _showImageSourceDialog,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Icon(Icons.file_upload_outlined, color: Colors.black,size: MediaQuery.of(context).size.width/20,),
                                      SizedBox(width: 5),
                                      Text(
                                        S.of(context).uploadImageButton,
                                        style: GoogleFonts.cairo(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (_image != null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(_image!,
                            height: MediaQuery.of(context).size.height/5,
                              width:MediaQuery.of(context).size.height/5 ,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffd3d3d3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            maxLines: 4,
                            cursorColor: headTitleColor,
                            controller: descriptionController,
                            decoration: InputDecoration(
                              hintText: S.of(context).descriptionHint,
                              hintStyle: GoogleFonts.cairo(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Add your form submission logic here
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: Color(0xFFCF9A2C), // button color
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        child: Text(
                          S.of(context).submitButton,
                          style: GoogleFonts.cairo(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              ListView.separated(
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, // Ensure both children take full height
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "يوسف",
                                style: GoogleFonts.cairo(
                                  fontSize:
                                  12.sp, // Adjust the size as needed
                                  fontWeight: FontWeight.bold,
                                  height:
                                  1.5, // Line height for better readability
                                ),
                              ),
                              Text(
                                "مطروح",
                                style: GoogleFonts.cairo(
                                  fontSize:
                                  12.sp, // Adjust the size as needed
                                  fontWeight: FontWeight.bold,
                                  color: thirdTripColor,
                                  height:
                                  1.5, // Line height for better readability
                                ),
                              ),
                              SizedBox(height: 5),
                              Flexible(
                                child: Text(
                                  S.of(context).flyer_txt,
                                  style: GoogleFonts.cairo(
                                    fontSize:
                                    8.sp, // Adjust the size as needed
                                    height:
                                    1.5, // Line height for better readability
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Localizations.localeOf(context)
                                  .languageCode ==
                                  "ar"
                                  ? Radius.circular(7)
                                  : Radius.circular(0),
                              bottomLeft: Localizations.localeOf(context)
                                  .languageCode ==
                                  "ar"
                                  ? Radius.circular(7)
                                  : Radius.circular(0),
                              topRight: Localizations.localeOf(context)
                                  .languageCode ==
                                  "ar"
                                  ? Radius.circular(0)
                                  : Radius.circular(7),
                              bottomRight: Localizations.localeOf(context)
                                  .languageCode ==
                                  "ar"
                                  ? Radius.circular(0)
                                  : Radius.circular(
                                  7)), // Match container's border radius
                          child: Image.asset(
                            "assets/images/matroh.png",
                            fit: BoxFit
                                .cover, // Fill to match the column's height
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                  separatorBuilder:(context, index) => SizedBox(height: 10.h,),
                  itemCount: 10)

            ],
          ),
        ),
      ),
    );
  }
}
