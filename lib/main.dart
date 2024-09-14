import 'package:flutter/material.dart';
import 'package:mama_and_co/features/service/presentation/screens/exam.dart';
import 'package:mama_and_co/features/service/presentation/screens/service_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ExpansionTileApp(),
    );
  }
}
