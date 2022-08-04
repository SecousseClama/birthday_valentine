// ignore_for_file: must_be_immutable, avoid_returning_null_for_void

import 'package:birthday_valentine/getDocGift.dart';
import 'package:birthday_valentine/updatedocgift.dart';
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
      body: FutureBuilder(
        future: getdoc,
        builder: (context,AsyncSnapshot<dynamic> snapshot) {
          var data = snapshot.data.data;
          return Stack(
            children: [
              Center(
                child: data['isOpened'] 
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Ton cadeau du jour ${widget.day + 1}', style: const TextStyle(fontFamily: 'Disney'), textScaleFactor: 2,),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 300,
                        height: 300,
                        child: Center(child: Text(data['gifted']))
                        ),
                  ],
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Gratte pour voir ton cadeau du jour ${widget.day + 1}', style: const TextStyle(fontFamily: 'Disney'), textScaleFactor: 2,),
                    Scratcher(
                      image: Image.asset('assets/gift.png'),
                      brushSize: 60,
                      threshold: 100,
                      color: Colors.red.shade100,
                      onChange: (value) => value >= 60 ? updateDocGift(widget.day + 1) : null,
                      onThreshold: () => null,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 300,
                        height: 300,
                        child: Center(child: Text(data['gifted']))
                        ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:40.0, left: 8),
                child: IconButton(onPressed: () => {Navigator.pop(context)}, icon: const Icon(Icons.arrow_back)),
              ),
            ],
          );
        },
      ),
    );
  }
}