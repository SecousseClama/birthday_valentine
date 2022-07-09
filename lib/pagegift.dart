import 'package:birthday_valentine/listgift.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

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
                Text('Gratte pour voir ton cadeau du jour ${widget.day + 1}', style: TextStyle(fontFamily: 'Disney'), textScaleFactor: 2,),
                Scratcher(
                  brushSize: 60,
                  threshold: 100,
                  color: Colors.red.shade100,
                  onChange: (value) => value >= 60 ? print('love') : null,
                  onThreshold: () => print("Threshold reached, you won!"),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 300,
                    height: 300,
                    child: Center(child: Text(gifts[widget.day].toString()))
                    ),
                )
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