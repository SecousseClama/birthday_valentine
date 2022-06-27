import 'dart:math';
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
  int timenow = int.parse(DateTime.now().millisecondsSinceEpoch.toString());
  int timestamp = 1664654400000;
  late int birthdayTime;
  late DateTime getBirthday;
  late String dateTime;
  canBeOpen() {
    if(166465440000000 >= birthdayTime){
      print('OK');
      Navigator.push(context, MaterialPageRoute(builder: (context) => PageGift(day: widget.day)));
    } else {
      print('NO');
      print(birthdayTime);
      print(dateTime);
      final snackBar = SnackBar(
        backgroundColor: Colors.red.shade400,
        content: Text('Il faut que tu attendes le $dateTime'),
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
          size: widget.day == 18 ? 85 : 55,
        ),
      ),
    );
  }
}