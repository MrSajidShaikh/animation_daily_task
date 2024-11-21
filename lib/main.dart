import 'package:animation_daily_task/Screen/drag_n_drop.dart';
import 'package:animation_daily_task/Screen/hero_widget_screen1.dart';
import 'package:animation_daily_task/Screen/positioned_widget.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeroWidgetScreen1(),
    );
  }
}
