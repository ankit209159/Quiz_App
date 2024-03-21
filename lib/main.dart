import 'package:flutter/material.dart';
import 'questions.dart';

void main() => runApp(const MyApp());

int qno = 0;

List<Icon> sk = <Icon>[];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void iconRow(bool condition) {
    setState(() {
      if (Qbrain().isFinished(sk.length) == true) {
        qno = 0;
        sk = <Icon>[];
      } else {
        if (Qbrain().answer(qno) == condition) {
          sk.add(const Icon(Icons.check, color: Colors.green));
        } else {
          sk.add(const Icon(Icons.close, color: Colors.red));
        }
        nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    Qbrain().question(qno),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  iconRow(true);
                },
                child: con(Colors.green, 'True'),
              ),
              TextButton(
                onPressed: () {
                  iconRow(false);
                },
                child: con(Colors.red, 'false'),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                  height: 40,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: sk,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Container con(Color c, var sa) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: c,
    ),
    height: 100,
    child: Center(
      child: Text(
        '$sa',
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  );
}

void nextQuestion() {
  if (qno < Qbrain().questionBank.length - 1) {
    qno++;
  }
}
