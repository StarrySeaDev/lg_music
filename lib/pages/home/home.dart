import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const Text(
            '歌单推荐',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          
        ],
      );
  }
  
}