import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option.dart';

/// pH module data
class WaterTempData {
  
  static String getStatusForValue(double value, double rangoMin, double rangoMax) {
    if (value < rangoMin) return "Frío";
    if (value > rangoMax) return "Caliente";
    return "Ambiente";
  }

  static Option getOption() {
    final String value = "24.5";
    final String rangoMin = "25";
    final String rangoMax = "35";
    return Option(
        title: "Temperatura del agua",
        subtitle: "Registro térmico actual",
        value: value,
        unit: "°C",
        color: ColorsAquanova.waterTempColor,
        minValue: "0",
        maxValue: "50",
        rangoMin: rangoMin,
        rangoMax: rangoMax,
        currentState: getStatusForValue(
            double.parse(value),
            double.parse(rangoMin),
            double.parse(rangoMax)),
        routeName: '/water-temp',
        iconTitle: 'lib/assets/icons/watertemp/water_temp.png',
        iconValue: 'lib/assets/icons/watertemp/temperature.png',
        iconUp: 'lib/assets/icons/watertemp/hot.png',
        iconDown: 'lib/assets/icons/watertemp/cold.png',
        iconGood: 'lib/assets/icons/watertemp/good.png',
        iconUpStatus: 'lib/assets/icons/watertemp/hot_info.png',
        iconDownStatus: 'lib/assets/icons/watertemp/cold_info.png',
        iconGoodStatus: 'lib/assets/icons/watertemp/good_info.png',
        graphText: "Temperatura del agua en °C",
      );
  }

  // Add pH-specific methods and data
  static List<Map<String, dynamic>> getSampleHistoricalData() {
    return [
      {"timestamp": "10/04/2025 12:00pm", "value": "35"},
      {"timestamp": "10/04/2025 03:00pm", "value": "33"},
      {"timestamp": "10/04/2025 06:00pm", "value": "22"},
      {"timestamp": "11/04/2025 09:00am", "value": "43"},
      {"timestamp": "11/04/2025 12:00pm", "value": "26"},
      {"timestamp": "11/04/2025 03:00pm", "value": "32"},
      {"timestamp": "11/04/2025 06:00pm", "value": "28"},
      {"timestamp": "12/04/2025 09:00am", "value": "26"},
      {"timestamp": "12/04/2025 12:00pm", "value": "40"},
      {"timestamp": "12/04/2025 03:00pm", "value": "26"},
      {"timestamp": "12/04/2025 06:00pm", "value": "30"},
    ];
  }
}
