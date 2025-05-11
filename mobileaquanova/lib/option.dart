import 'package:flutter/material.dart';

class Option {
  final String title;
  final String subtitle;
  final String value;
  final String unit;
  final String status;
  final Color color;
  final String minValue;
  final String maxValue;
  final String currentState;  
  final String routeName;
  final String iconTitle;
  final String iconValue;
  final String iconUp;
  final String iconDown;
  final String iconGood;
  final String iconUpStatus;
  final String iconDownStatus;
  final String iconGoodStatus;
  final String graphText;
  final String rangoMin;
  final String rangoMax;

  const Option({
    this.title = '',
    this.subtitle = '',
    this.value = '',
    this.unit = '',
    this.status = '',
    required this.color,
    this.minValue = '',
    this.maxValue = '',
    this.currentState = '',
    this.routeName = '',
    this.iconTitle = '',
    this.iconValue = '',
    this.iconUp = '',
    this.iconDown = '',
    this.iconGood = '',
    this.iconUpStatus = '',
    this.iconDownStatus = '',
    this.iconGoodStatus = '',
    this.graphText = '',
    this.rangoMin = '', 
    this.rangoMax = '',
  });
}