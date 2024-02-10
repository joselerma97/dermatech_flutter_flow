import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

bool isIssue(List<String> predictions) {
  List<String> illness = ['acne', 'melanoma'];

  // Convert lists to sets
  Set<String> set1 = Set.from(predictions);
  Set<String> set2 = Set.from(illness);

  // Intersect sets
  Set<String> intersection = set1.intersection(set2);

  // Check if intersection is not empty
  return intersection.isNotEmpty;
}
