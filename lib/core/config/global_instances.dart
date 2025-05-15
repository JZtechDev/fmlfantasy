import 'package:dio/dio.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/contacts_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Dio dio = Dio();

Future<String> getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? token = prefs.getString('token');
  return token ??
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJiNjBiODg3Yi1kZGNkLTRjN2YtOTYyNi1kMjI0OWE4NjE4YjkiLCJCcm9rZXJJZCI6IjMiLCJhZHg6YWNjb3VudCI6IjAiLCJuYW1lIjoibmVtYW5qYSIsInJvbGUiOiJhZG1pbiIsIm5iZiI6MTc0NTgyNjE1NiwiZXhwIjoxNzQ2NjkwMTU2LCJpYXQiOjE3NDU4MjYxNTYsImlzcyI6InNtYXJ0LWF1dGgiLCJhdWQiOiJzbWFydC1hcGkifQ.E17lSl53GIBo6B9Jifdy8_T7_b7H0iGKeB28CNWXFv0';
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

String? userName;
