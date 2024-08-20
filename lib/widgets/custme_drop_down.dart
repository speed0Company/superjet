import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/style_color.dart';
import '../generated/l10n.dart';

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  // List of dropdown items

  @override
  Widget build(BuildContext context) {
    List<String> _dropdownItems = [S.of(context).mini_jet];

    String _selectedItem =_dropdownItems[0] ; // Initial value

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        value: _selectedItem,
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down),
        underline: SizedBox(), // Hides the default underline
        items: _dropdownItems.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, textAlign: TextAlign.right,style: GoogleFonts.cairo(
              color: SecondTitleColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _selectedItem = newValue!;
          });
        },
      ),
    );
  }
}