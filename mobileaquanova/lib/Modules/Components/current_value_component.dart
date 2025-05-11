import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option.dart';

class CurrentValueComponent extends StatelessWidget {
  final Option option;

  const CurrentValueComponent({
    super.key,
    required this.option,
  });

  @override
  /// Builds a widget tree that represents a card displaying the current value.
  ///
  /// The card has rounded corners, a shadow, and a white background. Inside the card,
  /// there is a column containing:
  /// - An optional icon and a title "Valor Actual" with bold styling.
  /// - A subtitle displayed in a smaller font size and light grey color.
  /// - A row centered with an optional large icon representing the current value,
  ///   followed by the value and its unit in bold and colored styling.
  ///
  /// The styling and content of the icons and text are determined by the properties
  /// of the `option` parameter.

  Widget build(BuildContext context) {
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
                  'Valor Actual',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: ColorsAquanova.darkLetters,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  option.subtitle,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: ColorsAquanova.lightGrey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if (option.iconValue.isNotEmpty)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          option.iconValue,
                          width: 60,
                          height: 60,
                          color: option.color,
                        ),
                      ),
                    Column(
                      children: [
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              option.value,
                              style: TextStyle(
                                fontSize: 72.0,
                                fontWeight: FontWeight.bold,
                                color: option.color,
                              ),
                            ),
                            if (option.unit.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0, top: 15.0),
                                child: Text(
                                  option.unit,
                                  style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold,
                                    color: option.color,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}