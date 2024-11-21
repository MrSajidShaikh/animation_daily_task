import 'package:flutter/material.dart';
import 'hero_widget_screen1.dart';

class HeroWidgetScreen2 extends StatelessWidget {
  const HeroWidgetScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: selectedIndex,
                child: Image.network(
                  products[selectedIndex]['img'],
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              products[selectedIndex]['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'Price: ${products[selectedIndex]['price']}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              "the Supercharged 6.2L HEMI® V8 engine comes standard on the Dodge Challenger SRT® Hellcat models. Charged with 717 horsepower and 656 pound-feet of torque, anyone who dares to challenge you won't stand a chance.",
            ),
          ],
        ),
      ),
    );
  }
}
