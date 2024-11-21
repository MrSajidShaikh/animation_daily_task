import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class PositionedWidget extends StatefulWidget {
  const PositionedWidget({super.key});

  @override
  State<PositionedWidget> createState() => _PositionedWidgetState();
}

class _PositionedWidgetState extends State<PositionedWidget> {
  String name = "";
  bool showGreeting = false;
  bool showMessage = false;

  void resetAnimation() {
    setState(() {
      name = "";
      showGreeting = false;
      showMessage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: const Text(
          "Positioned Widget",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Name Animation
          AnimatedAlign(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            alignment: showGreeting ? Alignment.topLeft : Alignment.center,
            child: showGreeting
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1, // Ensure it animates only once
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Hey Mr. $name",
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      onFinished: () {
                        // Show message box after the animation finishes
                        setState(() {
                          showMessage = true;
                        });
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          // TextField Centered
          Center(
            child: showGreeting
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: TextField(
                      cursorColor: Colors.white,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.5),
                        ),
                      ),
                      onSubmitted: (value) {
                        setState(() {
                          name = value;
                          showGreeting = true;
                          Future.delayed(
                            const Duration(seconds: 10),
                            () {
                              resetAnimation();
                            },
                          );
                        });
                      },
                    ),
                  ),
          ),
          // Message Box
          AnimatedAlign(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              padding: const EdgeInsets.all(8),
              curve: Curves.easeInOut,
              width: showMessage ? MediaQuery.of(context).size.width * 0.8 : 0,
              height: showMessage ? 100 : 0,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: showMessage
                  ? const Center(
                      child: Text(
                        "The important thing is not how long you live. it's what you accomplish with your life.,,",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
