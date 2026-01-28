import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  final String heroTag;

  const GridViewScreen({super.key, required this.heroTag});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View - Rotate Once"),
        actions: [Hero(tag: widget.heroTag, child: Icon(Icons.grid_3x3, size: 50))],
      ),
      body: SafeArea(child: _buildBody(context: context)),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return Column(
      children: [
        Expanded(
          child: OrientationBuilder(
            builder: (context, orientation) {
              return Container(
                color: Colors.white,
                child: GridView.count(
                  // Create a grid with 2 columns in portrait mode, or
                  // 3 columns in landscape mode.
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                  // Generate 100 widgets that display their index in the list.
                  children: List.generate(100, (index) {
                    return Card(
                      color: Colors.orange,
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: TextTheme.of(context).displayLarge?.copyWith(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
