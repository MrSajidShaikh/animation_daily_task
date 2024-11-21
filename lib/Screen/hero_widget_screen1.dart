import 'package:animation_daily_task/Screen/hero_widget_screen2.dart';
import 'package:flutter/material.dart';

class HeroWidgetScreen1 extends StatefulWidget {
  const HeroWidgetScreen1({super.key});

  @override
  State<HeroWidgetScreen1> createState() => _HeroWidgetScreen1State();
}

class _HeroWidgetScreen1State extends State<HeroWidgetScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search_rounded),
          )
        ],
        leading: const Icon(Icons.menu_rounded),
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.greenAccent.shade100,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HeroWidgetScreen2(),
                        ),
                      );
                    },
                    child: Hero(
                      tag: index,
                      child: Image.network(
                        products[index]['img'],
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[index]['name'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Price: ${products[index]['price']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

int selectedIndex = 0;

List<Map<String, dynamic>> products = [
  {
    'name': 'Dodge Challenger SRT',
    'img': 'https://www.pngplay.com/wp-content/uploads/13/Dodge-Car-PNG-Photo-Image.png',
    'price': '\$178000',
  },
  {
    'name': 'BMW M5 CS',
    'img': 'https://carsguide-res.cloudinary.com/image/upload/f_auto,fl_lossy,q_auto,t_default/v1/editorial/vhs/BMW-M5.png',
    'price': '\$144000',
  },
  {
    'name': 'Supra MK3',
    'img': 'https://i.pinimg.com/originals/33/e7/bf/33e7bf063d5c54193b867dd6042c8384.png',
    'price': '\$149000',
  },
  {
    'name': 'Koenigsegg',
    'img': 'https://static.wikia.nocookie.net/tdx/images/2/20/Jesko.png/revision/latest?cb=20240609212135',
    'price': '\$169000',
  },
  {
    'name': 'Ford Mustang',
    'img': 'https://i.pinimg.com/originals/1d/b5/b5/1db5b5bea84a780f75dc73f3e3dab3ee.png',
    'price': '\$88000',
  },
  {
    'name': 'Bugatti Chiron',
    'img': 'https://pngimg.com/uploads/bugatti/bugatti_PNG17.png',
    'price': '\$132000',
  },
];