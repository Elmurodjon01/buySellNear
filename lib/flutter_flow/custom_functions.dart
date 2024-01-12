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

String? villageChoice(int? userChoice) {
  if (userChoice == 1) {
    return "동네질문";
  } else if (userChoice == 2) {
    return "동네사건사고";
  } else if (userChoice == 3) {
    return "겨울간식";
  } else if (userChoice == 4) {
    return "동네맛집";
  } else if (userChoice == 5) {
    return "동네소식";
  } else if (userChoice == 6) {
    return "취미생활";
  } else if (userChoice == 7) {
    return "일상";
  } else if (userChoice == 8) {
    return "분실/실종센터";
  } else if (userChoice == 9) {
    return "해주세요";
  } else if (userChoice == 10) {
    return "동네사진전";
  }
}

String? checkNegoitable(bool? isNegoitable) {
  if (isNegoitable == true) {
    return "Negoitable";
  } else if (isNegoitable == false) {
    return "Fixed price";
  }
  return "erorr";
}
