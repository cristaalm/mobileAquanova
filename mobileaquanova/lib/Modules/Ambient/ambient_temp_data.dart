import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option/option.dart';

/// Temperatura ambiente module data
class AmbientTempData {

  // Método para determinar el estado basado en valores
  static ({String status, Color color}) getStatusForValue(double value, double rangoMin, double rangoMax) {
    if (value < rangoMin) return (status: "Frío", color: ColorsAquanova.blue);
    if (value > rangoMax) return (status: "Caliente", color: ColorsAquanova.red);
    return (status: "Moderado", color: ColorsAquanova.green);
  }

  static Option getOption() {
    // Definiendo las variables aquí para poder usarlas
    final String value = "29.0";
    final String rangoMin = "25.0";
    final String rangoMax = "35.0";
    
    return Option(
      title: "Temperatura ambiente",
      subtitle: "ACTUALIZADO AHORA",
      value: value,
      unit: "°C",
      color: ColorsAquanova.ambientTempColor,
      minValue: "0",
      maxValue: "50",
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
      routeName: '/ambient-temp',
      iconTitle: 'lib/assets/icons/ambienttemp/sol.png',
      iconValue: 'lib/assets/icons/ambienttemp/amarillo_sol.png',
      iconUp: 'lib/assets/icons/ambienttemp/thermometer.png',
      iconDown: 'lib/assets/icons/ambienttemp/azul_viento.png',
      iconGood: 'lib/assets/icons/ambienttemp/verde_nube.png',
      iconUpStatus: 'lib/assets/icons/ambienttemp/amarillo_sol.png',
      iconDownStatus: 'lib/assets/icons/ambienttemp/azul_viento.png',
      iconGoodStatus: 'lib/assets/icons/ambienttemp/verde_nube.png',
      graphText: "Temperatura ambiente en °C",
    );
  }
  
  // Datos históricos de muestra
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