// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option/option.dart';
import 'package:mobileaquanova/option/options_factory.dart';
import 'package:mobileaquanova/option/option_card.dart';
import 'package:mobileaquanova/Modules/modules.dart';
import 'package:mobileaquanova/login/login_card.dart';

void main() {
  runApp(const AquanovaApp());
}

class AquanovaApp extends StatelessWidget {
  const AquanovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'Aquanova',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsAquanova.backgroundLight,
      ),
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const Home(),
        '/water-temp': (context) {
          final option = ModalRoute.of(context)!.settings.arguments as Option;
          return WaterTempModule(option: option);
        },
        '/conductivity': (context) {
          final option = ModalRoute.of(context)!.settings.arguments as Option;
          return CeModule(option: option);
        },
        '/ambient-temp': (context) {
          final option = ModalRoute.of(context)!.settings.arguments as Option;
          return AmbientTempModule(option: option);
        },
        '/ambient-humidity': (context) {
          final option = ModalRoute.of(context)!.settings.arguments as Option;
          return AmbientHumModule(option: option);
        },
        '/water-level': (context) {
          final option = ModalRoute.of(context)!.settings.arguments as Option;
          return WaterLevelModule(option: option);
        },
        '/ph': (context) {
          final option = ModalRoute.of(context)!.settings.arguments as Option;
          return PhModule(option: option);
        },
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Lista de opciones usando la clase factory
  late List<Option> optionsList;

  @override
  void initState() {
    super.initState();
    // Obtener todas las opciones desde la factory
    optionsList = OptionsFactory.getAllOptions();
  }

  // Navegar a la pantalla de detalle
  void _navigateToDetail(BuildContext context, Option option) {
    if (option.routeName.isNotEmpty) {
      Navigator.of(context).pushNamed(
        option.routeName,
        arguments: option,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'lib/assets/resources/logo.png',
          width: 150,
          height: 150,
        ),
        title: const Text(
          'AQUANOVA',
          style: TextStyle(
            color: ColorsAquanova.darkLetters,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorsAquanova.backgroundMedium,
        actions: [ 
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: ColorsAquanova.darkLetters, size: 30),
            onPressed: () { 
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen())
              );
            },
          ),
        ],
      ),
      backgroundColor: ColorsAquanova.backgroundLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título de sección
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Monitor",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: ColorsAquanova.darkLetters,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: optionsList.length,
                itemBuilder: (context, index) {
                  final option = optionsList[index];
                  return OptionCard(
                    key: Key('option_$index'),
                    option: option,
                    onTap: () => _navigateToDetail(context, option),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}