import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option/option.dart';

/// pH module data
class PhData {// Methods to determine status based on pH value
  /// Returns a string indicating the status of the pH value.
  ///
  /// The status can be "Ácido", "Alcalino" or "Óptimo".
  ///
  /// [value] is the pH value to evaluate.
  /// [rangoMin] is the minimum value of the range.
  /// [rangoMax] is the maximum value of the range.

  static ({String status, Color color}) getStatusForValue(double value, double rangoMin, double rangoMax) {
    if (value < rangoMin) return (status: "Ácido", color: ColorsAquanova.blue);
    if (value > rangoMax) return (status: "Alcalino", color: ColorsAquanova.red);
    return (status: "Óptimo", color: ColorsAquanova.green);
  }
  
  static Option getOption() {
    final String value = "6.8";
    final String rangoMin = "6.5";
    final String rangoMax = "7.5";
    return Option(
      title: "Nivel de pH del agua",
      subtitle: "ACTUALIZADO AHORA",
      value: value,
      unit: "ph",
      color: ColorsAquanova.phColor,
      minValue: "0.0",
      maxValue: "14.0",
      rangoMin: rangoMin,
      rangoMax: rangoMax,
      currentState: getStatusForValue(
            double.parse(value),
            double.parse(rangoMin),
            double.parse(rangoMax)).status,
        statusColor: getStatusForValue(
          double.parse(value),
            double.parse(rangoMin),
            double.parse(rangoMax)).color,
      routeName: '/ph',
      iconTitle: 'lib/assets/icons/ph/ph_icon.png',
      iconValue: 'lib/assets/icons/ph/ph_icon.png',
      iconUp: 'lib/assets/icons/ph/acido.png',
      iconDown: 'lib/assets/icons/ph/neutro.png',
      iconGood: 'lib/assets/icons/ph/alcalino.png',
      iconUpStatus: 'lib/assets/icons/ph/acido_status.png',
      iconDownStatus: 'lib/assets/icons/ph/neutro_status.png',
      iconGoodStatus: 'lib/assets/icons/ph/alcalino_status.png',
      graphText: "Nivel de pH del agua",
    );
  }

  // Add pH-specific methods and data
  static List<Map<String, dynamic>> getSampleHistoricalData() {
    return [
      {"timestamp": "15/04/2024 08:30", "value": "6.8"},
      {"timestamp": "15/04/2024 10:15", "value": "7.1"},
      {"timestamp": "14/04/2024 09:00", "value": "6.9"},
      {"timestamp": "14/04/2024 14:20", "value": "7.2"},
      {"timestamp": "13/04/2024 11:45", "value": "6.7"},
      {"timestamp": "12/04/2024 08:30", "value": "5.8"},
      {"timestamp": "11/04/2024 10:15", "value": "8.1"},
      {"timestamp": "10/04/2024 09:00", "value": "6.9"},
      {"timestamp": "09/04/2024 13:30", "value": "7.0"},
      {"timestamp": "08/04/2024 15:45", "value": "6.6"},
      {"timestamp": "07/04/2024 09:15", "value": "7.3"},
      {"timestamp": "06/04/2024 10:30", "value": "6.5"},
      {"timestamp": "05/04/2024 13:45", "value": "7.0"},
      {"timestamp": "04/04/2024 11:20", "value": "6.4"},
      {"timestamp": "03/04/2024 16:10", "value": "7.8"},
      {"timestamp": "02/04/2024 08:50", "value": "7.2"},
      {"timestamp": "01/04/2024 14:35", "value": "6.9"},
    ];
  }
}