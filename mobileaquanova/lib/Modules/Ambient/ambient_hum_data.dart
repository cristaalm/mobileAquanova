import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option/option.dart';

/// pH module data
class AmbientHumData {

  static ({String status, Color color}) getStatusForValue(double value, double rangoMin, double rangoMax) {
    if (value < rangoMin) return (status: "Baja", color: ColorsAquanova.blue);
    if (value > rangoMax) return (status: "Alta", color: ColorsAquanova.red);
    return (status: "Normal", color: ColorsAquanova.green);
  }
  
  static Option getOption() {
    final String value = "55";
    final String rangoMin = "50";
    final String rangoMax = "80";

    return Option(
      title: "Humedad ambiente",
      subtitle: "ACTUALIZADO AHORA",
      value: value,
      unit: "%",
      color: ColorsAquanova.ambientHumColor,
      minValue: "00",
      maxValue: "100",
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
      routeName: '/ambient-humidity',
      iconTitle: 'lib/assets/icons/ambienthum/gota.png',
      iconValue: 'lib/assets/icons/ambienthum/nube.png',
      iconUp: 'lib/assets/icons/ambienthum/gota.png',
      iconDown: 'lib/assets/icons/ambienthum/gota.png',
      iconGood: 'lib/assets/icons/ambienthum/gota.png',
      iconUpStatus: 'lib/assets/icons/ambienthum/gota.png',
      iconDownStatus: 'lib/assets/icons/ambienthum/gota.png',
      iconGoodStatus: 'lib/assets/icons/ambienthum/gota.png',
      graphText: "Humedad ambiente en %",
    );
  }

  // Add pH-specific methods and data
  static List<Map<String, dynamic>> getSampleHistoricalData() {
    return [
      {'timestamp': "27/04/2025 08:00", 'value': "55.0"},
      {'timestamp': "27/04/2025 08:10", 'value': "56.2"},
      {'timestamp': "27/04/2025 08:20", 'value': "54.7"},
      {'timestamp': "27/04/2025 08:30", 'value': "53.5"},
      {'timestamp': "27/04/2025 08:40", 'value': "57.3"},
      {'timestamp': "27/04/2025 08:50", 'value': "58.1"},
      {'timestamp': "27/04/2025 09:00", 'value': "59.4"},
      {'timestamp': "27/04/2025 09:10", 'value': "60.0"},
      {'timestamp': "27/04/2025 09:20", 'value': "58.6"},
      {'timestamp': "27/04/2025 09:30", 'value': "57.9"},
      {'timestamp': "27/04/2025 09:40", 'value': "56.8"},
      {'timestamp': "27/04/2025 09:50", 'value': "55.2"},
      {'timestamp': "27/04/2025 10:00", 'value': "54.1"},
      {'timestamp': "27/04/2025 10:10", 'value': "52.5"},
      {'timestamp': "27/04/2025 10:20", 'value': "51.8"},
      {'timestamp': "27/04/2025 10:30", 'value': "50.3"},
    ];
  }

}
