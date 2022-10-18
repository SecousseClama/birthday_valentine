// ignore_for_file: must_be_immutable, avoid_returning_null_for_void

import 'package:birthday_valentine/getDocGift.dart';
import 'package:birthday_valentine/updatedocgift.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class finalGift extends StatefulWidget {
  finalGift({Key? key,}) : super(key: key);

  @override
  State<finalGift> createState() => _finalGiftState();
}

class _finalGiftState extends State<finalGift> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade200,
      body: Stack(
        children: [
          Center(
            child: Text("Veux tu m'épouser ?", style: const TextStyle(fontFamily: 'Disney'), textScaleFactor: 4),
          ),
          Padding(
            padding: const EdgeInsets.only(top:40.0, left: 8),
            child: IconButton(onPressed: () => {Navigator.pop(context)}, icon: const Icon(Icons.arrow_back)),
          ),
        ],
      )
    );
  }
}