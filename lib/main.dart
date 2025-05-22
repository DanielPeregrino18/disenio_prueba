import 'package:disenio_prueba/home/expansion_prueba.dart';
import 'package:disenio_prueba/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 930),
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue)),
          routerConfig: router,
        );
      }
    );
  }
}

