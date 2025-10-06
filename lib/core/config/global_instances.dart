import 'package:dio/dio.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/contacts_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Dio dio = Dio();

Future<String> getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? token = prefs.getString('token');
  return token!;
}

String authToken = '';

Future<String> getLocal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? local = prefs.getString('local');
  return local!;
}

const String baseURL = 'http://40.113.171.107:57001';
const String clientApi = ' http://88.208.197.30:65006';
const String dailyMatchPickUrl = 'http://40.113.171.107:55016';
const String authenticationUrl = 'http://40.113.171.107:55004';
const String onBoardingUrl = 'http://40.113.171.107:55002';
const String userProfileUrl = 'http://40.113.171.107:55005';

//API URLS
// const String baseURL =
//     'https://smartabgapimanagement.azure-api.net/smartfantasybullsapi-dev';
// const String clientApi = 'https://smartabgapimanagement.azure-api.net';
// const String dailyMatchPickUrl =
//   'https://smartabgapimanagement.azure-api.net/smartdailymatchpickapi-dev';

//Subscription Keys
const String subscriptionkey = 'f175b60f0df541faaddd9371997cf5d8';
const String cricketSubscriptionKeyUs = '2e594f9c3a674715b27af86607ab22bb';
const String basketballSubscriptionKeyUs = '21079e4a61554166a7066dac82b83165';
const String americanFootballSubscriptionKeyUs =
    'b1e29f2df9dc4f1a81b4653bcc54cef2';
const String footballSubscriptionKeyUs = 'f175b60f0df541faaddd9371997cf5d8';
const String iceHockeySubscriptionKeyUs = 'a37a2a45c06d49498957fe35d66e6ca5';
const String baseballSubscriptionKeyUs = '30f95f82e4b54979a60d73afe13e0532';
const String dailyMatchPickKey = 'f175b60f0df541faaddd9371997cf5d8';

RxList<GetContacts> contacts = <GetContacts>[].obs;

RxString selectedSPort = 'AF'.obs;

RxString selectedTab = 'Fantasy Sports'.obs;

RxString selectedModule = 'dashboard'.obs;

String? userName;
