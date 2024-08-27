import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/screnns/book_screen.dart';
import '../colors/style_color.dart';
import '../generated/l10n.dart';

class BottomSheetPage extends StatefulWidget {
  final bool isFrom;
  final Function(String) onCitySelected;
  final List<String> cities;
  final String selectedCity;

  BottomSheetPage({
    required this.isFrom,
    required this.onCitySelected,
    required this.cities,
    required this.selectedCity,
  });

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    final filteredCities = widget.isFrom
        ? widget.cities
        : widget.cities.where((city) => city != widget.selectedCity).toList();

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                height: 2,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Text(
              widget.isFrom ? S.of(context).Select_travel_city : S.of(context).Select_travel_arrive,
              style: GoogleFonts.cairo(
                color: SecondTitleColor,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    // Pass the selected city back to the HomeScreen
                    widget.onCitySelected(filteredCities[index]);
                   if(widget.isFrom)
                     {
                       isErrorFrom=false;
                       setState(() {

                       });
                     }
                   else{
                     isErrorTo=false;
                     setState(() {

                     });
                   }

                    setState(() {

                    });
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        filteredCities[index],
                        style: GoogleFonts.cairo(
                          color: SecondTitleColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.navigate_next_rounded),
                    ],
                  ),
                ),
              ),
              itemCount: filteredCities.length,
            ),
          ),
        ],
      ),
    );
  }
}
