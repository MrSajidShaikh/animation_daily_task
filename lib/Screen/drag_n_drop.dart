import 'package:flutter/material.dart';

class DragNDrop extends StatefulWidget {
  const DragNDrop({super.key});

  @override
  State<DragNDrop> createState() => _DragNDropState();
}

class _DragNDropState extends State<DragNDrop> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          'Drag N Drop',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Wrap(
                children: List.generate(
                  name.length,
                  (index) {
                    if (restart == targetImage.length) {
                      for (int i = 0; i < targetImage.length; i++) {
                        targetImage[i] = false;
                      }
                      restart = 0;
                    }

                    return DragTarget<String>(
                      onAcceptWithDetails: (details) {
                        setState(() {
                          if (details.data == imagesTarget[index]) {
                            targetImage[index] = true;
                            draggableImages.remove(details.data);
                            restart += 1;

                            if (restart == targetImage.length) {
                              showCompletionDialog(context);
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Wrong match! Try again.',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.blueGrey,
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          ),
                          height: height * 0.1,
                          width: width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade500,
                          ),
                          child: (targetImage[index])
                              ? Image.network(
                                  imagesTarget[index],
                                  fit: BoxFit.cover,
                                )
                              : Text(name[index]),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Wrap(
              children: List.generate(
                draggableImages.length,
                (index) {
                  return Draggable<String>(
                    data: draggableImages[index],
                    feedback: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      height: height * 0.1,
                      width: width * 0.25,
                      child: Image.network(
                        draggableImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    childWhenDragging: Container(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      height: height * 0.1,
                      width: width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey,
                      ),
                      child: Image.network(
                        draggableImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCompletionDialog(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Congratulations!'),
            content: const Text('You have completed the puzzle.'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < targetImage.length; i++) {
                      targetImage[i] = false;
                    }
                    draggableImages = List.from(images);
                    restart = 0;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Play Again',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<String> name = [
  'Cat',
  'Leaf',
  'Tree',
  'Bird',
  'Panda',
  'Flower',
  'Mountain',
  'Butterfly',
  'Waterfall',
];

int restart = 0;

List<String> imagesTarget = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-C_UAhXq9GfuGO452EEzfbKnh1viQB9EDBQ&s',
  'https://img.freepik.com/free-photo/abstract-autumn-beauty-multi-colored-leaf-vein-pattern-generated-by-ai_188544-9871.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLQUQ6g6NjGqj3qncgsJGpxzzRrL_qDAc1qQ&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDo890dsxpB5UCLQFdVBWmK4qVxTrsrLEEUg&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1GkC-HcJ-A1up_LFocZl-jMADPgNezfjkoQ&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwEU6Ep8yxgBnw4ecTy1cftRLfBFH4patuSA&s',
  'https://img.freepik.com/premium-photo/beautiful-butterfly-images-brighten-your-day_1199394-94530.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVGlK9oVdrGeiL8FXSpvY9Sddtu9bMKFK5vQ&s',
];

List<bool> targetImage = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

List<String> images = [
  'https://img.freepik.com/premium-photo/beautiful-butterfly-images-brighten-your-day_1199394-94530.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVGlK9oVdrGeiL8FXSpvY9Sddtu9bMKFK5vQ&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwEU6Ep8yxgBnw4ecTy1cftRLfBFH4patuSA&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLQUQ6g6NjGqj3qncgsJGpxzzRrL_qDAc1qQ&s',
  'https://img.freepik.com/free-photo/abstract-autumn-beauty-multi-colored-leaf-vein-pattern-generated-by-ai_188544-9871.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDo890dsxpB5UCLQFdVBWmK4qVxTrsrLEEUg&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-C_UAhXq9GfuGO452EEzfbKnh1viQB9EDBQ&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1GkC-HcJ-A1up_LFocZl-jMADPgNezfjkoQ&s',
];

List<String> draggableImages = List.from(images);
