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

  /// `Favorites`
  String get fav {
    return Intl.message(
      'Favorites',
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

  /// `Total Number Of Points Is`
  String get total_points {
    return Intl.message(
      'Total Number Of Points Is',
      name: 'total_points',
      desc: '',
      args: [],
    );
  }

  /// `Points`
  String get point {
    return Intl.message(
      'Points',
      name: 'point',
      desc: '',
      args: [],
    );
  }

  /// `Previous trips`
  String get previous_trips {
    return Intl.message(
      'Previous trips',
      name: 'previous_trips',
      desc: '',
      args: [],
    );
  }

  /// `Register Now And Win`
  String get register_now {
    return Intl.message(
      'Register Now And Win',
      name: 'register_now',
      desc: '',
      args: [],
    );
  }

  /// `250 Points`
  String get gift_point {
    return Intl.message(
      '250 Points',
      name: 'gift_point',
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
