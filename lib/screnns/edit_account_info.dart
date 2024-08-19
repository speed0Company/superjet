import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../generated/l10n.dart';
import 'account_screen.dart';
import 'edit_info_screen.dart';
import 'edit_pass_screen.dart';

class EditAccountInfo extends StatelessWidget {
   EditAccountInfo({required this.name,required this.email});
  final String name;
  final String email;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffcf9a2b),
                        borderRadius: BorderRadius.circular(100),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('assets/images/profile_icon.png',width: 40,height: 40,),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cairo(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),Text(
                         email,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cairo(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Divider(
                color: Colors.grey,
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditInfoScreen(),));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                S.of(context).edit_account_info,
                textAlign: TextAlign.center,
                style: aboutTextStyle(),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditPassScreen(),));

            },

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                S.of(context).edit_password,
                textAlign: TextAlign.center,
                style: aboutTextStyle(),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
