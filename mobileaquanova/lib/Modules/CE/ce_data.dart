import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option/option.dart';

/// pH module data
class CeData {

  static ({String status, Color color}) getStatusForValue(double value, double rangoMin, double rangoMax) {
    if (value < rangoMin) return (status: "Baja", color: ColorsAquanova.blue);
    if (value > rangoMax) return (status: "Alta", color: ColorsAquanova.red);
    return (status: "Óptima", color: ColorsAquanova.green);
  }

  static Option getOption() {
    // Definiendo las variables aquí para poder usarlas
    final String value = "750";
    final String rangoMin = "300";
    final String rangoMax = "1200";
    
    return Option(
      title: "Conductividad eléctrica",
      subtitle: "ACTUALIZADO AHORA",
      value: value,
      unit: "s/m",
      color: ColorsAquanova.ceColor,
      minValue: "0",
      maxValue: "2000",
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
      routeName: '/conductivity',
      iconTitle: 'lib/assets/icons/ce/verdeElecricity.png',
      iconValue: 'lib/assets/icons/ce/elecricity.png',
      iconUp: 'lib/assets/icons/ce/amarilloElecricity.png',
      iconDown: 'lib/assets/icons/ce/rojoElecricity.png',
      iconGood: 'lib/assets/icons/ce/verdeElecricity.png',
      iconUpStatus: 'lib/assets/icons/ce/amarilloElecricity.png',
      iconDownStatus: 'lib/assets/icons/ce/rojoElecricity.png',
      iconGoodStatus: 'lib/assets/icons/ce/verdeElecricity.png',
      graphText: "Conductividad eléctrica en s/m",
    );
  }

  // Add pH-specific methods and data
  static List<Map<String, dynamic>> getSampleHistoricalData() {
    return [
      {"timestamp": "10/04/2025 12:00", "value": "750"},
      {"timestamp": "10/04/2025 15:00", "value": "800"},
      {"timestamp": "10/04/2025 18:00", "value": "700"},
      {"timestamp": "11/04/2025 09:00", "value": "900"},
      {"timestamp": "11/04/2025 12:00", "value": "850"},
      {"timestamp": "11/04/2025 15:00", "value": "950"},
      {"timestamp": "11/04/2025 18:00", "value": "1000"},
      {"timestamp": "12/04/2025 09:00", "value": "1100"},
      {"timestamp": "12/04/2025 12:00", "value": "1200"},
      {"timestamp": "12/04/2025 15:00", "value": "1300"},
      {"timestamp": "12/04/2025 18:00", "value": "1400"},
    ];
  }
}
