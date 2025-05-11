import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option.dart';

class LimitsComponent extends StatelessWidget {
  final Option option;
  final double progress;

  const LimitsComponent({
    super.key, 
    required this.option,
    required this.progress,
  });

  // Get appropriate status icon based on current state
  String _getStatusIcon() {
  double currentValue = double.tryParse(option.value) ?? 0;
  
  if (currentValue > (double.tryParse(option.rangoMax) ?? 0)) {
    return option.iconUpStatus;   // High status
  } else if (currentValue < (double.tryParse(option.rangoMin) ?? 0)) {
    return option.iconDownStatus; // Low status
  } else {
    return option.iconGoodStatus; // Normal/Moderate status
  }
}

  @override
  Widget build(BuildContext context) {
    String statusIcon = _getStatusIcon();

    return Card(
      elevation: 5,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (option.iconTitle.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: ColorsAquanova.backgroundLight,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Image.asset(
                      option.iconTitle,
                      width: 20,
                      height: 20,
                      color: ColorsAquanova.darkLetters,
                    ),
                  ),
                Text(
                  'Límites configurados',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: ColorsAquanova.darkLetters,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Range values
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MÍN ${option.minValue} ${option.unit}',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: ColorsAquanova.darkLetters,
                  ),
                ),
                Text(
                  'MÁX ${option.maxValue} ${option.unit}',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: ColorsAquanova.darkLetters,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8.0),

            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: progress,
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorsAquanova.progressColor,
                ),
                minHeight: 12,
              ),
            ),

            const SizedBox(height: 16.0),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorsAquanova.backgroundMedium,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (statusIcon.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Image.asset(statusIcon, width: 24, height: 24, color: ColorsAquanova.darkLetters,),
                    ),
                  Text(
                    'Estado: ${option.currentState}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: ColorsAquanova.darkLetters,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}