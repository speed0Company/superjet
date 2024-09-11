import 'package:dio/dio.dart';

import '../consts/consts.dart';

class TripService {
  final Dio _dio = Dio();
  TripService() {
    // Set default options if needed
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<List<dynamic>> searchTrips({
    required String from,
    required String to,
    required String date,
    required String chairs,
  }) async {
    try {
      Response response = await _dio.get(
        '/trip-search',
        queryParameters: {
          'from': from,
          'to': to,
          'date': date,
          'chairs': chairs,
        },
      );

      if (response.statusCode == 200) {
        // Get the list of trips and buses from the response
        List<dynamic> trips = response.data["trips"];
        List<dynamic> buses = response.data["buses"];

        // Filter out trips where TripStatus is "0"
        List<dynamic> filteredTrips = trips.where((trip) => trip['TripStatus'] != "0").toList();

        // Map over the filtered trips and replace bus_type with bus NameA
        List<dynamic> tripsWithBusNames = filteredTrips.map((trip) {
          // Find the corresponding bus in the buses list based on bus_type (trip['bus_type'])
          var matchingBus = buses.firstWhere(
                (bus) => bus['Code'] == trip['bus_type'],
            orElse: () => null,
          );

          // Replace bus_type with the NameA (Arabic name of the bus), or keep the original value if no match
          trip['bus_type'] = matchingBus != null ? matchingBus['NameA'] : trip['bus_type'];

          return trip;
        }).toList();

        return tripsWithBusNames; // Returning the trips with bus names
      } else {
        // If API returns an unexpected status code
        throw Exception('Failed to load trips');
      }
    } catch (e) {
      print("Error fetching trips: $e");
      return []; // Return an empty list in case of an error
    }
  }
}
