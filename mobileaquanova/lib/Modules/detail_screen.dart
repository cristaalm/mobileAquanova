import 'package:flutter/material.dart';
import 'package:mobileaquanova/option.dart';
import 'package:mobileaquanova/Modules/base_module.dart';

class DetailScreen extends StatelessWidget {
  final Option option;

  const DetailScreen({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return BaseModule(option: option);
  }
}