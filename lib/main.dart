import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: timer_App(),
    );
  }
}

class timer_App extends StatefulWidget {
  const timer_App({super.key});

  @override
  State<timer_App> createState() => _date_timeState();
}

class _date_timeState extends State<timer_App> {
  int num = 15;
  Timer? stop;

  void startTimer() {
    stop = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (num > 0) {
          num--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              num.toString().padLeft(2, "0"),
              style: const TextStyle(fontSize: 80, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              "seconds",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    startTimer();
                    if (num == 0) {
                      setState(() {
                        num = 15;
                      });
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  child: const Text(
                    "start timer",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    stop!.cancel();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  child: const Text(
                    "stop timer",
                    style: TextStyle(fontSize: 19),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
