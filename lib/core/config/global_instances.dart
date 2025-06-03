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

Future<String> getLocal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? local = prefs.getString('local');
  return local!;
}

//API URLS
const String baseURL =
    'https://smartabgapimanagement.azure-api.net/smartfantasybullsapi-dev';
const String clientApi = 'https://smartabgapimanagement.azure-api.net';
const String dailyMatchPickUrl =
    'https://smartabgapimanagement.azure-api.net/smartdailymatchpickapi-dev';

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

RxString selectedSPort = 'CR'.obs;

RxString selectedTab = 'Fantasy Sports'.obs;

RxString selectedModule = 'dashboard'.obs;

String? userName;
