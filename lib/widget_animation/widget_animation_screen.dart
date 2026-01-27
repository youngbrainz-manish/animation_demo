import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WidgetAnimationScreen extends StatefulWidget {
  final String heroTag;
  const WidgetAnimationScreen({super.key, required this.heroTag});

  @override
  State<WidgetAnimationScreen> createState() => _WidgetAnimationScreenState();
}

class _WidgetAnimationScreenState extends State<WidgetAnimationScreen> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Animation Screen"),
        actions: [Hero(tag: widget.heroTag, child: Icon(Icons.widgets_rounded))],
      ),
      body: SafeArea(child: _buildBody(context: context)),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Column(
                children: AnimateList(
                  interval: 400.ms,
                  effects: [FadeEffect(duration: 900.ms)],
                  children: [Text("Hello"), Text("World"), Text("Goodbye")],
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: animation.value,
                  width: animation.value,
                  child: const FlutterLogo(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
