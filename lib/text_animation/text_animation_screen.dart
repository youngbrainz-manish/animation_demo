import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextAnimationScreen extends StatefulWidget {
  final String heroTag;
  const TextAnimationScreen({super.key, required this.heroTag});

  @override
  State<TextAnimationScreen> createState() => _TextAnimationScreenState();
}

class _TextAnimationScreenState extends State<TextAnimationScreen> {
  bool isVisible = true;
  bool isBig = false;
  bool isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Animation"),
        actions: [
          Hero(
            tag: widget.heroTag,
            child: CircleAvatar(child: Icon(Icons.format_color_text_rounded)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  'Typing animation in Flutter',
                  textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 4,
            ),

            SizedBox(height: 50),
            AnimatedOpacity(
              opacity: isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: const Text('Hello Flutter', style: TextStyle(fontSize: 36, color: Colors.red)),
            ),
            SizedBox(height: 26),
            AnimatedScale(
              scale: isBig ? 2 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: const Text('Scaling Text', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 16),

            AnimatedSlide(
              offset: isMoved ? Offset.zero : const Offset(0, 0.5),
              duration: const Duration(milliseconds: 400),
              child: const Text('Slide Animation', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: visible,
            tooltip: 'Visible',
            child: Icon(isVisible ? Icons.remove_red_eye : Icons.visibility_off),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: bigText,
            tooltip: 'Big',
            child: Icon(isBig ? Icons.expand_more : Icons.expand_less),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: move,
            tooltip: 'move',
            child: Icon(isMoved ? Icons.move_up_outlined : Icons.move_down),
          ),
        ],
      ),
    );
  }

  void visible() {
    isVisible = !isVisible;
    setState(() {});
  }

  void bigText() {
    isBig = !isBig;
    setState(() {});
  }

  void move() {
    isMoved = !isMoved;
    setState(() {});
  }
}
