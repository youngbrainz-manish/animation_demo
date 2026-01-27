import 'package:flutter/material.dart';

class CustomTextAnimation extends StatefulWidget {
  final String heroTag;
  const CustomTextAnimation({super.key, required this.heroTag});

  @override
  State<CustomTextAnimation> createState() => _CustomTextAnimationState();
}

class _CustomTextAnimationState extends State<CustomTextAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));

    _opacity = Tween<double>(begin: 0, end: 1).animate(_controller);
    _offset = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Animated Text"),
        actions: [Hero(tag: widget.heroTag, child: Icon(Icons.animation))],
      ),
      body: SafeArea(child: buildBody(context: context)),
    );
  }

  Widget buildBody({required BuildContext context}) {
    return Column(
      children: [
        Expanded(
          child: FadeTransition(
            opacity: _opacity,
            child: SlideTransition(
              position: _offset,
              child: const Text('Custom Animated Text', style: TextStyle(fontSize: 22)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
