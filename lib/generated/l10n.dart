// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Book Your Trip`
  String get head_title {
    return Intl.message(
      'Book Your Trip',
      name: 'head_title',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Select Travel City`
  String get from_title {
    return Intl.message(
      'Select Travel City',
      name: 'from_title',
      desc: '',
      args: [],
    );
  }

  /// `Select Destination City`
  String get to_title {
    return Intl.message(
      'Select Destination City',
      name: 'to_title',
      desc: '',
      args: [],
    );
  }

  /// `Number Of Seats`
  String get number_of_set_title {
    return Intl.message(
      'Number Of Seats',
      name: 'number_of_set_title',
      desc: '',
      args: [],
    );
  }

  /// `Travel Date`
  String get travel_date {
    return Intl.message(
      'Travel Date',
      name: 'travel_date',
      desc: '',
      args: [],
    );
  }

  /// `Show Trips`
  String get show_trip {
    return Intl.message(
      'Show Trips',
      name: 'show_trip',
      desc: '',
      args: [],
    );
  }

  /// `Select travel city`
  String get Select_travel_city {
    return Intl.message(
      'Select travel city',
      name: 'Select_travel_city',
      desc: '',
      args: [],
    );
  }

  /// `Select Arrival Station`
  String get Select_travel_arrive {
    return Intl.message(
      'Select Arrival Station',
      name: 'Select_travel_arrive',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get select_date {
    return Intl.message(
      'Select Date',
      name: 'select_date',
      desc: '',
      args: [],
    );
  }

  /// `reservation`
  String get reservation {
    return Intl.message(
      'reservation',
      name: 'reservation',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Seat(s)`
  String get sets_title {
    return Intl.message(
      'Please Select Seat(s)',
      name: 'sets_title',
      desc: '',
      args: [],
    );
  }

  /// `Selected Seats`
  String get selected_seats {
    return Intl.message(
      'Selected Seats',
      name: 'selected_seats',
      desc: '',
      args: [],
    );
  }

  /// `Reserved Seats`
  String get reserved_seats {
    return Intl.message(
      'Reserved Seats',
      name: 'reserved_seats',
      desc: '',
      args: [],
    );
  }

  /// `Available seats`
  String get available_seats {
    return Intl.message(
      'Available seats',
      name: 'available_seats',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get book_now {
    return Intl.message(
      'Book Now',
      name: 'book_now',
      desc: '',
      args: [],
    );
  }

  /// `Login Account`
  String get login_account {
    return Intl.message(
      'Login Account',
      name: 'login_account',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Chairs Left`
  String get remaining_chairs {
    return Intl.message(
      'Chairs Left',
      name: 'remaining_chairs',
      desc: '',
      args: [],
    );
  }

  /// `Tickets`
  String get tickets {
    return Intl.message(
      'Tickets',
      name: 'tickets',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register A New Account By Email`
  String get register_new_acc {
    return Intl.message(
      'Register A New Account By Email',
      name: 'register_new_acc',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get name_required {
    return Intl.message(
      'Name is required',
      name: 'name_required',
      desc: '',
      args: [],
    );
  }

  /// `Name should be at least 4 characters`
  String get name_too_short {
    return Intl.message(
      'Name should be at least 4 characters',
      name: 'name_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Name should be less than 50 characters`
  String get name_too_long {
    return Intl.message(
      'Name should be less than 50 characters',
      name: 'name_too_long',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get email_required {
    return Intl.message(
      'Email is required',
      name: 'email_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get invalid_email {
    return Intl.message(
      'Please enter a valid email address',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get password_required {
    return Intl.message(
      'Password is required',
      name: 'password_required',
      desc: '',
      args: [],
    );
  }

  /// `Password should be at least 6 characters`
  String get password_too_short {
    return Intl.message(
      'Password should be at least 6 characters',
      name: 'password_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation password is required`
  String get confirm_password_required {
    return Intl.message(
      'Confirmation password is required',
      name: 'confirm_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwords_do_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `There are no trips at the selected station`
  String get not_found_trip {
    return Intl.message(
      'There are no trips at the selected station',
      name: 'not_found_trip',
      desc: '',
      args: [],
    );
  }

  /// `back`
  String get back {
    return Intl.message(
      'back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Private Trips`
  String get private_trips {
    return Intl.message(
      'Private Trips',
      name: 'private_trips',
      desc: '',
      args: [],
    );
  }

  /// `Cities and Stations`
  String get Cities_Stations {
    return Intl.message(
      'Cities and Stations',
      name: 'Cities_Stations',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Edit Account Info`
  String get edit_account_info {
    return Intl.message(
      'Edit Account Info',
      name: 'edit_account_info',
      desc: '',
      args: [],
    );
  }

  /// `Edit Password`
  String get edit_password {
    return Intl.message(
      'Edit Password',
      name: 'edit_password',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get old_pass {
    return Intl.message(
      'Current Password',
      name: 'old_pass',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_pass {
    return Intl.message(
      'New Password',
      name: 'new_pass',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_pass {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_pass',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get to_setting {
    return Intl.message(
      'Setting',
      name: 'to_setting',
      desc: '',
      args: [],
    );
  }

  /// `Private Trip`
  String get to_private_trip {
    return Intl.message(
      'Private Trip',
      name: 'to_private_trip',
      desc: '',
      args: [],
    );
  }

  /// `Book your own trip`
  String get mini_jet_title {
    return Intl.message(
      'Book your own trip',
      name: 'mini_jet_title',
      desc: '',
      args: [],
    );
  }

  /// `Mini Jet`
  String get mini_jet {
    return Intl.message(
      'Mini Jet',
      name: 'mini_jet',
      desc: '',
      args: [],
    );
  }

  /// `Chose Car`
  String get chose_car {
    return Intl.message(
      'Chose Car',
      name: 'chose_car',
      desc: '',
      args: [],
    );
  }

  /// `Search for a trip`
  String get search_for_private_trip {
    return Intl.message(
      'Search for a trip',
      name: 'search_for_private_trip',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get error_form_filed_name {
    return Intl.message(
      'Please enter your name',
      name: 'error_form_filed_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get error_form_filed_phone_number {
    return Intl.message(
      'Please enter your phone number',
      name: 'error_form_filed_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `phone number`
  String get phone_number {
    return Intl.message(
      'phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get user_name {
    return Intl.message(
      'Name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Recurrent Passenger Program`
  String get flyer {
    return Intl.message(
      'Recurrent Passenger Program',
      name: 'flyer',
      desc: '',
      args: [],
    );
  }

  /// `A distinguished service provided to Superjet customers. The customer registers via email and obtains 250 points as a result of registration. The number of points increases with every trip the customer takes, and thus he can obtain benefits such as a percentage discount on trips and free trips.`
  String get flyer_txt {
    return Intl.message(
      'A distinguished service provided to Superjet customers. The customer registers via email and obtains 250 points as a result of registration. The number of points increases with every trip the customer takes, and thus he can obtain benefits such as a percentage discount on trips and free trips.',
      name: 'flyer_txt',
      desc: '',
      args: [],
    );
  }

  /// `Canal Cities`
  String get qana_citys {
    return Intl.message(
      'Canal Cities',
      name: 'qana_citys',
      desc: '',
      args: [],
    );
  }

  /// `Qibli Cities`
  String get eqbli_citys {
    return Intl.message(
      'Qibli Cities',
      name: 'eqbli_citys',
      desc: '',
      args: [],
    );
  }

  /// `Discover Egypt`
  String get discovey_egypt {
    return Intl.message(
      'Discover Egypt',
      name: 'discovey_egypt',
      desc: '',
      args: [],
    );
  }

  /// `International Trips`
  String get international {
    return Intl.message(
      'International Trips',
      name: 'international',
      desc: '',
      args: [],
    );
  }

  /// `Tourist Destinations`
  String get syahia {
    return Intl.message(
      'Tourist Destinations',
      name: 'syahia',
      desc: '',
      args: [],
    );
  }

  /// `Why choose Super Jet?`
  String get why_chosse_us {
    return Intl.message(
      'Why choose Super Jet?',
      name: 'why_chosse_us',
      desc: '',
      args: [],
    );
  }

  /// `Super Jet Categories`
  String get super_jet_categories {
    return Intl.message(
      'Super Jet Categories',
      name: 'super_jet_categories',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get fav {
    return Intl.message(
      'Favorite',
      name: 'fav',
      desc: '',
      args: [],
    );
  }

  /// `My Trips`
  String get my_trip {
    return Intl.message(
      'My Trips',
      name: 'my_trip',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Bahary Cities`
  String get bahary_citys {
    return Intl.message(
      'Bahary Cities',
      name: 'bahary_citys',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria`
  String get alex_city {
    return Intl.message(
      'Alexandria',
      name: 'alex_city',
      desc: '',
      args: [],
    );
  }

  /// `The bride of the Mediterranean and the most famous coastal city in Egypt, it has picturesque attractions that make it the appropriate destination for spending an enjoyable time, such as the Mastani Column, the Greek and Roman Museum, Montazah Gardens, Antoniades Gardens, Qaitbay Citadel, St. Mark’s Cathedral, and Waterfall Gardens.`
  String get alex_disc {
    return Intl.message(
      'The bride of the Mediterranean and the most famous coastal city in Egypt, it has picturesque attractions that make it the appropriate destination for spending an enjoyable time, such as the Mastani Column, the Greek and Roman Museum, Montazah Gardens, Antoniades Gardens, Qaitbay Citadel, St. Mark’s Cathedral, and Waterfall Gardens.',
      name: 'alex_disc',
      desc: '',
      args: [],
    );
  }

  /// `Marsa Matrouh`
  String get matroh_city {
    return Intl.message(
      'Marsa Matrouh',
      name: 'matroh_city',
      desc: '',
      args: [],
    );
  }

  /// `It is known as the city of charming beaches due to the beauty of the waters, the various beaches, and the diversity of attractions such as:. Cleopatra's Baths, Ramses II Temple, Salt Cave, Al-Umeed Reserve. You can also visit the summer circus and the Syrian Chinese market.`
  String get matroh_disc {
    return Intl.message(
      'It is known as the city of charming beaches due to the beauty of the waters, the various beaches, and the diversity of attractions such as:. Cleopatra\'s Baths, Ramses II Temple, Salt Cave, Al-Umeed Reserve. You can also visit the summer circus and the Syrian Chinese market.',
      name: 'matroh_disc',
      desc: '',
      args: [],
    );
  }

  /// `North Coast`
  String get sahal_city {
    return Intl.message(
      'North Coast',
      name: 'sahal_city',
      desc: '',
      args: [],
    );
  }

  /// `The northern coast is characterized by fresh water and sandy beaches, in addition to various activities such as an aqua park, concerts, barbecues, and many water sports.`
  String get sahal_disc {
    return Intl.message(
      'The northern coast is characterized by fresh water and sandy beaches, in addition to various activities such as an aqua park, concerts, barbecues, and many water sports.',
      name: 'sahal_disc',
      desc: '',
      args: [],
    );
  }

  /// `New Alamein`
  String get alamin_city {
    return Intl.message(
      'New Alamein',
      name: 'alamin_city',
      desc: '',
      args: [],
    );
  }

  /// `New Alamein is a new Egyptian city from the fourth generation cities in Egypt, located in Matrouh Governorate and administratively affiliated to the New Urban Communities Authority.`
  String get alamin_disc {
    return Intl.message(
      'New Alamein is a new Egyptian city from the fourth generation cities in Egypt, located in Matrouh Governorate and administratively affiliated to the New Urban Communities Authority.',
      name: 'alamin_disc',
      desc: '',
      args: [],
    );
  }

  /// `Port Said`
  String get borsaid_city {
    return Intl.message(
      'Port Said',
      name: 'borsaid_city',
      desc: '',
      args: [],
    );
  }

  /// `Port Said (The Valiant City) Port Said is distinguished by its various foods, such as madfouna and baklawis, in addition to many distinctive places such as the Salt Mountain, the Church of Saint Eugenie, and the Port Fouad Reserve and Beach.`
  String get borsaid_disc {
    return Intl.message(
      'Port Said (The Valiant City) Port Said is distinguished by its various foods, such as madfouna and baklawis, in addition to many distinctive places such as the Salt Mountain, the Church of Saint Eugenie, and the Port Fouad Reserve and Beach.',
      name: 'borsaid_disc',
      desc: '',
      args: [],
    );
  }

  /// `Suez`
  String get suez_city {
    return Intl.message(
      'Suez',
      name: 'suez_city',
      desc: '',
      args: [],
    );
  }

  /// `Suez, an Egyptian city, the capital of the Suez Governorate, located at the head of the Gulf of Suez, and the largest Egyptian city overlooking the Red Sea. The Suez Canal is named after the city.`
  String get suez_disc {
    return Intl.message(
      'Suez, an Egyptian city, the capital of the Suez Governorate, located at the head of the Gulf of Suez, and the largest Egyptian city overlooking the Red Sea. The Suez Canal is named after the city.',
      name: 'suez_disc',
      desc: '',
      args: [],
    );
  }

  /// `Qena`
  String get qena_city {
    return Intl.message(
      'Qena',
      name: 'qena_city',
      desc: '',
      args: [],
    );
  }

  /// `Qena Governorate is one of the southern governorates of Egypt, located about 600 km south of Cairo.`
  String get qena_disc {
    return Intl.message(
      'Qena Governorate is one of the southern governorates of Egypt, located about 600 km south of Cairo.',
      name: 'qena_disc',
      desc: '',
      args: [],
    );
  }

  /// `Luxor`
  String get luxor_city {
    return Intl.message(
      'Luxor',
      name: 'luxor_city',
      desc: '',
      args: [],
    );
  }

  /// `Luxor, known as the city of the hundred gates or the city of the sun, was previously known as Thebes and was the capital of Egypt in the Pharaonic era. It is located on the banks of the Nile River.`
  String get luxor_disc {
    return Intl.message(
      'Luxor, known as the city of the hundred gates or the city of the sun, was previously known as Thebes and was the capital of Egypt in the Pharaonic era. It is located on the banks of the Nile River.',
      name: 'luxor_disc',
      desc: '',
      args: [],
    );
  }

  /// `Minya`
  String get minya_city {
    return Intl.message(
      'Minya',
      name: 'minya_city',
      desc: '',
      args: [],
    );
  }

  /// `Minya, an Egyptian city, is nicknamed the Bride of Upper Egypt, located in central Egypt on the western bank of the Nile River.`
  String get minya_disc {
    return Intl.message(
      'Minya, an Egyptian city, is nicknamed the Bride of Upper Egypt, located in central Egypt on the western bank of the Nile River.',
      name: 'minya_disc',
      desc: '',
      args: [],
    );
  }

  /// `Sohag`
  String get sohag_city {
    return Intl.message(
      'Sohag',
      name: 'sohag_city',
      desc: '',
      args: [],
    );
  }

  /// `Sohag is a city located on the western bank of the Nile River in Egypt and the capital of Sohag Governorate.`
  String get sohag_disc {
    return Intl.message(
      'Sohag is a city located on the western bank of the Nile River in Egypt and the capital of Sohag Governorate.',
      name: 'sohag_disc',
      desc: '',
      args: [],
    );
  }

  /// `Asyut`
  String get asiut_city {
    return Intl.message(
      'Asyut',
      name: 'asiut_city',
      desc: '',
      args: [],
    );
  }

  /// `Asyut is the largest city in Upper Egypt and the capital of Asyut Governorate, housing the first regional university (Asyut University).`
  String get asiut_disc {
    return Intl.message(
      'Asyut is the largest city in Upper Egypt and the capital of Asyut Governorate, housing the first regional university (Asyut University).',
      name: 'asiut_disc',
      desc: '',
      args: [],
    );
  }

  /// `Sharm El Sheikh`
  String get sharm_city {
    return Intl.message(
      'Sharm El Sheikh',
      name: 'sharm_city',
      desc: '',
      args: [],
    );
  }

  /// `Sharm El Sheikh is considered a global tourist attraction due to its distinctive natural and tourist environment, characterized by coral reefs, fish, and various activities such as diving and sailing.`
  String get sharm_desc {
    return Intl.message(
      'Sharm El Sheikh is considered a global tourist attraction due to its distinctive natural and tourist environment, characterized by coral reefs, fish, and various activities such as diving and sailing.',
      name: 'sharm_desc',
      desc: '',
      args: [],
    );
  }

  /// `Nuweiba`
  String get nwabea_city {
    return Intl.message(
      'Nuweiba',
      name: 'nwabea_city',
      desc: '',
      args: [],
    );
  }

  /// `Nuweiba is an Egyptian city that follows the South Sinai Governorate and overlooks the Gulf of Aqaba.`
  String get nwabea_desc {
    return Intl.message(
      'Nuweiba is an Egyptian city that follows the South Sinai Governorate and overlooks the Gulf of Aqaba.',
      name: 'nwabea_desc',
      desc: '',
      args: [],
    );
  }

  /// `Hurghada`
  String get gardga_city {
    return Intl.message(
      'Hurghada',
      name: 'gardga_city',
      desc: '',
      args: [],
    );
  }

  /// `Hurghada is the administrative capital of the Red Sea Governorate and occupies a coastal strip on the western shore of the Red Sea.`
  String get gardga_desc {
    return Intl.message(
      'Hurghada is the administrative capital of the Red Sea Governorate and occupies a coastal strip on the western shore of the Red Sea.',
      name: 'gardga_desc',
      desc: '',
      args: [],
    );
  }

  /// `Safaga`
  String get safaga_city {
    return Intl.message(
      'Safaga',
      name: 'safaga_city',
      desc: '',
      args: [],
    );
  }

  /// `Safaga contains many tourist villages and is specialized in diving training, fishing competitions, and various recreational tourism activities.`
  String get safaga_desc {
    return Intl.message(
      'Safaga contains many tourist villages and is specialized in diving training, fishing competitions, and various recreational tourism activities.',
      name: 'safaga_desc',
      desc: '',
      args: [],
    );
  }

  /// `Jordan`
  String get jordan_country {
    return Intl.message(
      'Jordan',
      name: 'jordan_country',
      desc: '',
      args: [],
    );
  }

  /// `Superjet provides trips to Jordan, a country that mixes the majestic civilizations of the past and a bustling city. Whatever your inclinations, you will find what suits you in Jordan, the country of adventure, history, art, and distinctive food.`
  String get jourdan_desc {
    return Intl.message(
      'Superjet provides trips to Jordan, a country that mixes the majestic civilizations of the past and a bustling city. Whatever your inclinations, you will find what suits you in Jordan, the country of adventure, history, art, and distinctive food.',
      name: 'jourdan_desc',
      desc: '',
      args: [],
    );
  }

  /// `Libya`
  String get libya_country {
    return Intl.message(
      'Libya',
      name: 'libya_country',
      desc: '',
      args: [],
    );
  }

  /// `A mixture of deserts and vegetables. You can enjoy the charming natural atmosphere on the Green Mountain, which is full of trees and various agricultural crops, in addition to the distinctive nature of the climate.`
  String get lipya_desc {
    return Intl.message(
      'A mixture of deserts and vegetables. You can enjoy the charming natural atmosphere on the Green Mountain, which is full of trees and various agricultural crops, in addition to the distinctive nature of the climate.',
      name: 'lipya_desc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
