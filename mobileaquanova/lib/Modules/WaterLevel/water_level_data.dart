import 'package:flutter/foundation.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option.dart';

/// Water Level module data
class WaterLevelData {

 static String getStatusForValue(double value, double rangoMin, double rangoMax) {
    if (value < rangoMin) return "Bajo";
    if (value > rangoMax) return "Alto";
    return "Óptimo";
  }
  static Option getOption() {
    final String value = "50";
    final String rangoMin = "40";
    final String rangoMax = "60";
    return Option(
      title: "Nivel del agua",
      subtitle: "ACTUALIZADO AHORA",
      value: value,
      unit: "cm",
      color: ColorsAquanova.nivelAguaColor,
      minValue: "30",
      maxValue: "70",
      rangoMin: rangoMin,
      rangoMax: rangoMax,
      currentState: getStatusForValue(
        double.parse(value),
        double.parse(rangoMin),
        double.parse(rangoMax)
      ),
      routeName: '/water-level',
      iconTitle: 'lib/assets/icons/waterlevel/botella-de-agua.png',
      iconValue: 'lib/assets/icons/waterlevel/icon_water.png',
      iconUp: 'lib/assets/icons/waterlevel/overflow-water-yellow.png',
      iconDown: 'lib/assets/icons/waterlevel/low-water-blue.png',
      iconGood: 'lib/assets/icons/waterlevel/optimal-water-green.png',
      iconUpStatus: 'lib/assets/icons/waterlevel/overflow-water.png',
      iconDownStatus: 'lib/assets/icons/waterlevel/low-water.png',
      iconGoodStatus: 'lib/assets/icons/waterlevel/optimal-water.png',
      graphText: "Nivel del agua en cm",
    );
  }

  static List<Map<String, dynamic>> getSampleHistoricalData() {
    return [
      {'timestamp': "27/04/2025 08:00", 'value': "22.0"},
      {'timestamp': "27/04/2025 08:10", 'value': "28.5"},
      {'timestamp': "27/04/2025 08:20", 'value': "12.5"},
      {'timestamp': "27/04/2025 08:30", 'value': "19.0"},
      {'timestamp': "27/04/2025 08:40", 'value': "36.8"},
      {'timestamp': "27/04/2025 08:50", 'value': "40.2"},
      {'timestamp': "27/04/2025 09:00", 'value': "30.0"},
      {'timestamp': "27/04/2025 09:10", 'value': "15.7"},
      {'timestamp': "27/04/2025 09:20", 'value': "38.0"},
      {'timestamp': "27/04/2025 09:30", 'value': "25.0"},
      {'timestamp': "27/04/2025 09:40", 'value': "10.0"},
      {'timestamp': "27/04/2025 09:50", 'value': "35.5"},
      {'timestamp': "27/04/2025 10:00", 'value': "23.4"},
      {'timestamp': "27/04/2025 10:10", 'value': "9.0"},
      {'timestamp': "27/04/2025 10:20", 'value': "42.1"},
      {'timestamp': "27/04/2025 10:30", 'value': "26.7"},
    ];
  }
}
