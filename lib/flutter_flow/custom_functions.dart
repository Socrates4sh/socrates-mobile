import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> getDialCode() {
  List<Map<String, String>> countriesWithDialCodes = [
    {'country': 'US', 'dial_code': '+1'},
    {'country': 'CA', 'dial_code': '+1'},
    {'country': 'UK', 'dial_code': '+44'},
    {'country': 'AU', 'dial_code': '+61'},
    {'country': 'IND', 'dial_code': '+91'},
    {'country': 'DE', 'dial_code': '+49'},
    {'country': 'FR', 'dial_code': '+33'},
    {'country': 'JP', 'dial_code': '+81'},
    {'country': 'CN', 'dial_code': '+86'},
    {'country': 'BR', 'dial_code': '+55'},
  ];

  // Display both the country name and dial code, but return only the dial code
  List<String> dialCodesWithCountry = countriesWithDialCodes.map((country) {
    return '${country['dial_code']} - ${country['country']}'; // Display both for user
  }).toList();

  // Set up a mapping from display value to dial code for retrieval
  Map<String, String> displayToDialCode = {
    for (var country in countriesWithDialCodes)
      '${country['dial_code']} - ${country['country']}': country['dial_code']!
  };

  // Example: Retrieve dial code by display value (assuming this part is needed)
  String selectedDisplayValue =
      dialCodesWithCountry.first; // Replace with user selection logic
  String selectedDialCode = displayToDialCode[selectedDisplayValue]!;

  print(
      'Selected Dial Code: $selectedDialCode'); // This will return only the dial code

  return dialCodesWithCountry; // Still returns the display list to show both
}

int findIndexOfTable(
  List<WebsiteVideosRecord> websiteVideo,
  double videoSeq,
) {
  int index = websiteVideo.indexWhere((row) => row.videoSequence == videoSeq);
  return index;
}

DateTime getSubscriptionEndDate(int startDay) {
  DateTime now = DateTime.now(); // Current date & time

  DateTime subscriptionEndDateTime = now.add(Duration(days: startDay));

  print("Date & Time After 7 Days: $subscriptionEndDateTime");
  return subscriptionEndDateTime;
}

bool checkVideoInFavourite(
  List<VideoDocsMylistStruct> userVideoList,
  VideoDocsMylistStruct videoDoc,
) {
  return userVideoList.any((item) => item.videoDocId == videoDoc.videoDocId);
}
