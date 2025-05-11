import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option.dart';

class OptionCard extends StatelessWidget {
  final Option option;
  final Function()? onTap;

  const OptionCard({
    super.key,
    required this.option,
    this.onTap,
  });

  // Get appropriate status icon based on current state
  String _getStatusIcon() {
    if (option.currentState.toLowerCase().contains('alto') || 
        option.currentState.toLowerCase().contains('elevado')) {
      return option.iconUpStatus;
    } else if (option.currentState.toLowerCase().contains('bajo')) {
      return option.iconDownStatus;
    } else {
      return option.iconGoodStatus;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate progress based on min and max values if they exist
    double progress = 0.5; // Default to middle
    if (option.minValue.isNotEmpty && option.maxValue.isNotEmpty && option.value.isNotEmpty) {
      try {
        double min = double.parse(option.minValue.replaceAll(',', '.'));
        double max = double.parse(option.maxValue.replaceAll(',', '.'));
        double value = double.parse(option.value.replaceAll(',', '.'));
        progress = (value - min) / (max - min);
        progress = progress.clamp(0.0, 1.0); // Ensure progress is between 0 and 1
      } catch (e) {
        // If parsing fails, keep default progress
      }
    }

    String statusIcon = _getStatusIcon();

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(8),
        color: Colors.white,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header: Title and icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 6,
                    height: 30,
                    decoration: BoxDecoration(
                      color: option.color,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      option.title,
                      style: TextStyle(
                        color: ColorsAquanova.darkLetters,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (option.iconTitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        option.iconTitle,
                        width: 30,
                        height: 30,
                        color: option.color,
                      ),
                    ),
                ],
              ),
              
              // Subtitle
              if (option.subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 14),
                  child: Text(
                    option.subtitle,
                    style: TextStyle(
                      color: ColorsAquanova.lightGrey,
                      fontSize: 12,
                    ),
                  ),
                ),
                
              const SizedBox(height: 12),
              
              // Value with icon
                Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  if (option.iconValue.isNotEmpty)
                    Container(
                    margin: const EdgeInsets.only(right: 14),
                    child: Image.asset(
                      option.iconValue,
                      width: 50,
                      height: 50,
                      color: option.color,
                    ),
                    ),
                  
                  // Value and unit
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                    Text(
                      option.value.isNotEmpty ? option.value : 'N/A',
                      style: TextStyle(
                      color: ColorsAquanova.darkLetters,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (option.unit.isNotEmpty)
                      Text(
                      option.unit,
                      style: TextStyle(
                        color: ColorsAquanova.darkLetters,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),
                  ],
                ),
                ),

              const SizedBox(height: 14),
              
              // Min and Max values
              if (option.minValue.isNotEmpty && option.maxValue.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'MÍN ${option.minValue} ${option.unit}',
                        style: TextStyle(
                          color: ColorsAquanova.darkLetters,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'MÁX ${option.maxValue} ${option.unit}',
                        style: TextStyle(
                          color: ColorsAquanova.darkLetters,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                
              const SizedBox(height: 8),
              
              // Progress bar
              if (option.minValue.isNotEmpty && option.maxValue.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      valueColor: AlwaysStoppedAnimation<Color>(ColorsAquanova.progressColor),
                      minHeight: 8,
                    ),
                  ),
                ),
                
              const SizedBox(height: 14),
              
              // Status indicator
              if (option.currentState.isNotEmpty)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 14),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsAquanova.backgroundStatus,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset(
                            statusIcon,
                            width: 20,
                            height: 20,
                            color: ColorsAquanova.darkLetters,
                          ),
                        ),
                      Text(
                        option.currentState,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsAquanova.darkLetters,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}