// ignore_for_file: must_be_immutable

import 'dart:math';
import 'package:birthday_valentine/getDocGift.dart';
import 'package:birthday_valentine/pagegift.dart';
import 'package:flutter/material.dart';

class Gift extends StatefulWidget {
  Gift({Key? key,required this.day}) : super(key: key);
  int day;

  @override
  State<Gift> createState() => _GiftState();
}

class _GiftState extends State<Gift> {
  bool isHovering = false;
  List<Color> colors = [Colors.white,Colors.red.shade400, Colors.red.shade300];
  int timestamp = 1664643600000;
  late int birthdayTime;
  late DateTime getBirthday;
  late String dateTime;

  canBeOpen() {
    if(9999999999999999 >= birthdayTime){
      getdocgift(widget.day + 1);
      Navigator.push(context, MaterialPageRoute(builder: (context) => PageGift(day: widget.day)));
    } else {
      final snackBar = SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating, 
        elevation: 3,
        backgroundColor: Colors.red.shade400,
        content: Text('Il faut que tu attendes le $dateTime',style: const TextStyle(fontFamily: 'Disney'), textScaleFactor: 1.5,),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    birthdayTime = timestamp + (widget.day * (3600 * 24) * 1000);
    // print(birthdayTime);
    getBirthday = DateTime.fromMillisecondsSinceEpoch(birthdayTime);
    dateTime = "${getBirthday.day}/${getBirthday.month}/${getBirthday.year}  ${getBirthday.hour}h${getBirthday.minute}0";
    // print(dateTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onHover: (value) => setState(() {
        isHovering = value;
      }),
      onPressed: () => {
        canBeOpen()
        },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 600),
        scale: isHovering ? 1.3 : 1,
        child:Icon(
          Icons.card_giftcard_rounded,
          color: colors[Random().nextInt(colors.length)], 
          size: widget.day + 1 == 19 ? 85 : 55,
        ),
      ),
    );
  }
}