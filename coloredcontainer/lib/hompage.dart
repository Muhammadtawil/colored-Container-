import 'dart:async';

import 'package:flutter/material.dart';

class SampleContainer extends StatelessWidget {
  const SampleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: const Center(child: ChangingColor()),
    );
  }
}

class ChangingColor extends StatefulWidget {
  const ChangingColor({super.key});

  @override
  State<ChangingColor> createState() => _ChangingColorState();
}

class _ChangingColorState extends State<ChangingColor> {
  late Timer _timer;
  List<Color> arrColors = [
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.yellow,
  ];
  int _pos = 0;
  List<int> arrSeconds = [1, 2, 3, 4, 5]; //here I set array for seconds

  @override
  void initState() {
    super.initState();
    changeColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: arrColors[_pos],
      ),
      child: const Center(
          child: Text(
        'ع',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      )),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    // _timer = ;
    super.dispose();
  }

  Future<void> changeColor() async {
    var second = 0;
    var colorCount = 1;
    var count = 0;
    var totalList = [];
    for (var e in arrSeconds) {
      count = count + 1;
      totalList.add(count);
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (totalList[totalList.length - 1] == second) {
        _timer.cancel();

        setState(() {
          _pos = 0;
        });
        changeColor();
      } else {
        if (totalList.contains(second)) {
          setState(() {
            _pos = colorCount;
            colorCount++;
          });
        }
      }

      second++;
    });
  }
}
