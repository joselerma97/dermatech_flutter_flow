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

String doubleToPercentageString(double value) {
  // Convert to percentage and round to 2 decimal places
  String percentage = (value * 100).toStringAsFixed(2);
  // Append '%' to make it clear it's a percentage
  return "$percentage%";
}

String getIllnessData(List<PredResultStruct> predictRresults) {
  PredResultStruct result = predictRresults[0];
  String name = result.name;
  double score = result.score;
  String scorePercentage = doubleToPercentageString(score);
  return "We recommend you to go to a doctor because we detected $name with $scorePercentage. There are some good options:";
}
