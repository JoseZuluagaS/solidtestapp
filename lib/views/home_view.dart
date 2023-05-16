import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:solidtestapp/views/gallery_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Color buttonBackgroundColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        buttonBackgroundColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
        setState(() {
        });
      },
      style: ElevatedButton.styleFrom(backgroundColor: buttonBackgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Hello There"),
          IconButton(onPressed: (){
            Navigator.push<MaterialPageRoute>(context, MaterialPageRoute(builder: (context) => const GalleryView()));
          }, icon: const Icon(Icons.browse_gallery))
        ],
      ),
    );
  }
}
