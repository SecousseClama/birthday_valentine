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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Birthday's Valentine", style: TextStyle(fontFamily: 'Disney'), textScaleFactor: 1.7,),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.red.shade200,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
          crossAxisCount: 4,  
          crossAxisSpacing: 4.0,  
          mainAxisSpacing: 4.0  
        ), 
        itemCount: 19,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Gift(day: index),
              Text('${index + 1}', style: TextStyle(fontFamily: 'Disney'), textScaleFactor: 1.2),
            ],
          );
        }),
      ),
    );
  }
}
