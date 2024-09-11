import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/services/get_city_api.dart';
import 'package:superjet/widgets/alert_widget.dart';

class BottomSheetPage extends StatefulWidget {
  final bool isFrom;
  final Function(String) onStationSelected;
  final Function(String) onCitySelected;
  final Function(String)? onCityToSelected;
  final Function(String)? getCodeCityFrom;
  final Function(String)? getCodeCityTo;
  final String selectedCity;

  BottomSheetPage({
    required this.isFrom,
    required this.onStationSelected,
    required this.selectedCity,
    required this.onCitySelected,
     this.onCityToSelected,
    this.getCodeCityFrom,
 this.getCodeCityTo
  });

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  List cities = [];
  List stations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCitiesAndStations(context);
  }

  Future<void> fetchCitiesAndStations(BuildContext context) async {
    try {
      Map<String,dynamic> data=await GetCitiesApi().getCities();
      setState(() {
        cities = data['cities'];
        stations = data['stations'];
        isLoading = false; // Data fetched, stop loading indicator

      });
    } catch (e) {
      Navigator.pop(context); // Close the bottom sheet after station selection

      showAlertDialog(context,"حدث خطأ برجاء المحاولة مره اخري");
      isLoading = false; // Data fetched, stop loading indicator
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Remove the first item from both cities and stations, only when this instance is created
    if (cities.isNotEmpty) {
      cities.removeAt(0); // Remove the first city
    }
    if (stations.isNotEmpty) {
      stations.removeAt(0); // Remove the first station
    }

    // Filter cities based on whether it's the 'From' or 'To' selection
    List filteredCities = widget.isFrom
        ? cities
        : cities.where((city) => city['NameA'] != widget.selectedCity).toList(); // Hide 'From' city

    return isLoading
        ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching data
        : Container(
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
              widget.isFrom ? "Select Travel City" : "Select Arrive City",
              style: GoogleFonts.cairo(
                color: Colors.black,
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
                    if(!widget.isFrom)
                      {
                        widget.onCityToSelected!(cities[index+1]['NameA']);
                        // print(cities[index+1]['NameA']);

                      }
                    if(widget.isFrom)
                      {
                        widget.onCitySelected(cities[index]['NameA']);

                      }
                    final selectedCity = filteredCities[index];
                    final cityCode = selectedCity['Code'];

                    // Find related stations for the selected city
                    final relatedStations = stations
                        .where((station) =>
                    station['TripRegion_Code'] == cityCode)
                        .toList();

                    // Show the stations for the selected city
                    _showStationsBottomSheet(
                        context, relatedStations, selectedCity['NameA']);
                  },
                  child: Row(
                    children: [
                      Text(
                        filteredCities[index]['NameA'],
                        style: GoogleFonts.cairo(
                          color: Colors.black,
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

  // Method to show stations dialog when a city is selected
  void _showStationsBottomSheet(
      BuildContext context, List stations, String selectedCity) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Wrap the content
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
              "Select Station",
              style: GoogleFonts.cairo(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true, // So the bottom sheet doesn't take full screen height
              itemCount: stations.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  stations[index]['NameA'],
                  style: GoogleFonts.cairo(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Select the station and close the bottom sheet
                  widget.onStationSelected(stations[index]['NameA']);
                  if(widget.isFrom)
                    {
                      widget.getCodeCityFrom!(stations[index]['Code']);
                    }
                  else{
                    widget.getCodeCityTo!(stations[index]['Code']);

                  }

                  Navigator.pop(context); // Close the bottom sheet after station selection
                  Navigator.pop(context); // Close the BottomSheetPage after station selection
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
