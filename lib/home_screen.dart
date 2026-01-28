import 'package:animation_demo/grid_view/grid_view_screen.dart';
import 'package:animation_demo/text_animation/custom_text_animation.dart';
import 'package:animation_demo/text_animation/text_animation_screen.dart';
import 'package:animation_demo/widget_animation/widget_animation_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> dataList = [
    {"id": 1, "name": "Text Animation Screen", "icon": Icon(Icons.text_rotation_angleup), "tag": "ani_text"},
    {"id": 2, "name": "Custom Text Animation Screen", "icon": Icon(Icons.animation), "tag": "custtext_ani"},
    {"id": 3, "name": "Widget Animation Screen", "icon": Icon(Icons.widgets_rounded), "tag": "ani_wid"},
    {"id": 4, "name": "GridView Screen", "icon": Icon(Icons.grid_3x3_sharp), "tag": "grid_icon"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation List")),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = dataList[index];
                return GestureDetector(
                  onTap: () {
                    handleNavigation(data: data);
                  },
                  child: Card(
                    child: ListTile(
                      leading: Hero(
                        tag: data['tag'],
                        child: CircleAvatar(child: data['icon']),
                      ),
                      title: Text("${data['name']}"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> handleNavigation({required Map<String, dynamic> data}) async {
    final Map<int, Widget> screenMap = {
      1: TextAnimationScreen(heroTag: data['tag']),
      2: CustomTextAnimation(heroTag: data['tag']),
      3: WidgetAnimationScreen(heroTag: data['tag']),
      4: GridViewScreen(heroTag: data['tag']),
    };

    final screen = screenMap[data['id']];

    if (screen != null) {
      await Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
    }

    setState(() {});
  }
}
