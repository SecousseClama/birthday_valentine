import 'dart:async';

import 'package:birthday_valentine/finalpage.dart';
import 'package:birthday_valentine/gift.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Timer? countdownTimer;
  var currentTime = DateTime.now();
  final timeDemande = 1666202400000;
  late Duration countdown;

  @override
  void initState() {
    super.initState();
    countdown = Duration(milliseconds: timeDemande - currentTime.millisecondsSinceEpoch);
    startTimer();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = countdown.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        countdown = Duration(seconds: seconds);
        // print(countdown);
        print(seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(countdown.inHours.remainder(24));
    final minutes = strDigits(countdown.inMinutes.remainder(60));
    final seconds = strDigits(countdown.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Birthday's Valentine", style: TextStyle(fontFamily: 'Disney'), textScaleFactor: 1.7,),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.red.shade200,
      body: Column(
        children: [
          Container(
            width: 500,
            height: 700,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                crossAxisCount: 4,  
                crossAxisSpacing: 4.0,  
                mainAxisSpacing: 4.0,
              ), 
              itemCount: 19,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Gift(day: index),
                    Text('${index + 1}', style: const TextStyle(fontFamily: 'Disney'), textScaleFactor: 1.2),
                  ],
                );
              }),
            ),
          ),
          countdown.inSeconds <= 10800 &&  countdown.inSeconds != 0 ? Text('$hours:$minutes:$seconds', style: const TextStyle(fontFamily: 'Disney'), textScaleFactor: 2,) : const SizedBox.shrink(),
          countdown.inSeconds == 0 ? TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => finalGift())), child: Text('Clique ICI pour ton cadeau final !', style: const TextStyle(fontFamily: 'Disney', color: Colors.white), textScaleFactor: 1.5,)) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
