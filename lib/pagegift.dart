import 'package:birthday_valentine/listgift.dart';
import 'package:flutter/material.dart';

class PageGift extends StatefulWidget {
  PageGift({Key? key, required this.day}) : super(key: key);
  int day;

  @override
  State<PageGift> createState() => _PageGiftState();
}

class _PageGiftState extends State<PageGift> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade200,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(gifts[widget.day].toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:40.0, left: 8),
            child: IconButton(onPressed: () => {Navigator.pop(context)}, icon: Icon(Icons.arrow_back)),
          ),
        ],
      ),
    );
  }
}