import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var data = [
    Colors.pink,
    Colors.blue,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blueGrey
  ];
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: data.asMap().entries.map<Widget>((entry) {
              var key = entry.key + 1;
              return Expanded(
                child: Container(
                  color: entry.value,
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    child: const Text('container'),
                    onPressed: () {
                      final audioPlayer = AudioPlayer();
                      audioPlayer.play(AssetSource("note$key.wav"));
                      if (kDebugMode) {
                        print("Pressed");
                      }
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
